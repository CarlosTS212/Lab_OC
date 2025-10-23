%include "../LIB/pc_iox.inc"

section .data
    N dw 0

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

   
    ; Punto a)
    mov ebx, 0x5C4B2A60
    mov eax, 0x02218655
    add ebx, eax

    mov eax, ebx
    call pHex_dw

    mov al,10
    call putchar
    call putchar
    
    



    ; Punto b)
    push bx
    mov ax, bx
    call pHex_w

    mov al, 10
    call putchar
    call putchar



    ; Punto c)
    movzx ax, bl              
    shl ax, 3                 
    mov [N], ax               

    mov ax, [N]
    call pHex_w

    mov al, 10
    call putchar
    call putchar



    ; Punto d)
    inc word [N]
    mov ax, [N]
    call pHex_w

    mov al, 10
    call putchar
    call putchar


    ; Punto e)
    mov ax, bx         
    xor dx, dx         
    mov cx, 0x00FF     
    div cx             

    ; mostrar cociente
    mov eax, eax       
    call pHex_w
    mov al, 10
    call putchar

    ; mostrar residuo 
    mov ax, dx
    call pHex_w
    

    mov al, 10
    call putchar
    call putchar


    ; Punto f)
    mov ax, [N]        
    add ax, dx         
     
    call pHex_w        
    mov [N], ax ;Mover ax a N Para el punto g


    mov al, 10
    call putchar
    call putchar


    ; Punto g)       
    
    dec word [N] 
    mov ax, [N]     
    call pHex_w
    

    mov al, 10
    call putchar
    

    ; imprimir registro de banderas 
    pushfd             
    pop eax            
    call pHex_dw       

    mov al, 10
    call putchar
    call putchar

    ; Punto h)
    pop bx             
    mov ax, bx
    call pHex_w        

    mov al, 10
    call putchar
    call putchar


	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel