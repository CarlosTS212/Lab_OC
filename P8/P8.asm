%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

   
    ;------------------------ Punto a)----------------------- 
    mov edx, ingresar
    call puts
    call getche

    cmp al,"a"
    jl fin_a
    cmp al,"z"
    jg fin_a

    cmp al,"m"
    jl menor_a
    mov edx,mayor
    mov al,10
    call putchar
    call puts
    jmp fin_a

    menor_a:
    mov edx, menor
    mov al,10
    call putchar
    call puts

    fin_a:

    mov al,10
    call putchar
    call putchar

    ;------------------Punto b)-------------------- 
    mov edx, ingresar
    call puts
    call getche

    cmp al,"0"
    jl es_ninguno
    cmp al, "9"
    jl es_numero

    cmp al,"Z"
    jg es_ninguno
    cmp al,"A"
    jg es_letra

    es_ninguno:
    mov al,10
    call putchar
    mov edx, ninguno
    call puts
    jmp fin_b

    es_numero:
    mov al,10
    call putchar
    mov edx, numero
    call puts
    jmp fin_b

    es_letra:
    mov al,10
    call putchar
    mov edx, letra
    call puts

    fin_b:

    mov al,10
    call putchar
    call putchar

    ;--------------------Punto c)---------------------
    mov edx, ingresar
    call puts
    call getche

    sub al,48

    cmp al,0
    jl fin_c
    cmp al,9
    jg fin_c

    mov cx,ax
    mov edx, asterisco
    mov al,10
    call putchar

    ciclo_c:
        mov bx,cx
        ciclo_r:
            call puts
        loop ciclo_r
        call putchar
        mov cx, bx
    loop ciclo_c
        
    fin_c:

    ;-------------------Punto d)----------------------
    mov edx, ingresar_d
    call puts

    mov cx,10
    loop_10
        call getche
        push al




	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

section	.data
ingresar db  'Ingrese un dato: ',0 
ingresar_d db  'Ingrese 10 datos: ',0 
menor db  'Es menor que m',10,0 
mayor db  'Es mayor que m',10,0 
numero db  'Es un numero',10,0 
letra db  'Es una letra Mayuscula',10,0 
ninguno db  'Es ninguno',10,0 
asterisco db  '*',0 

