%include "../LIB/pc_iox.inc"

section	.data
ingresar_a db  'Ingrese el primer arreglo',0 
ingresar_b db  'Ingrese el segundo arreglo',0 
ingresar_c db  'Ingrese un numero entre 0 a 9 para imprimir una piramide de *: ',0 
arreglo_1 db 0,0,0,0,0,0,0,0,0,0
arreglo_2 db 0,0,0,0,0,0,0,0,0,0

N equ 10

section	.text

	global _start       ;must be declared for using gcc



_start:                     ;tell linker entry point

   
    ;------------------------ Punto a)----------------------- 

    ;------------------------ Punto b)----------------------- 
    mov ebx, arreglo_1
    mov ecx, N
    call capturar

    mov edx, arreglo_2
    mov ecx, N
    call capturar

    call salto

    mov ebx, arreglo_1
    mov edx, arreglo_2
    call sumar

    mov ebx, arreglo_1
    mov ecx, N
    call imprimir
    






	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

    salto:
        push eax
        mov al,10
        call putchar
        pop eax
    ret

    capturar:
        cap:
            call getch
            cmp al, '0'
            jb cap
            cmp al, '9'
            ja cap
            call putchar
            sub al, '0'
            mov [ebx],al
            inc ebx
    loop capturar
    ret



    imprimir:
        leer:
            mov byte al, [ebx]
            call pHex_b
            inc ebx
            call salto
        loop leer
    ret

    sumar:
        sum:
        mov eax, 000000000000000
        add eax, ebx
        mov [ebx], [ebx + edx]
        inc ebx
        inc edx
        loop sum
    ret

   


