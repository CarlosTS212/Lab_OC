%include "../LIB/pc_iox.inc"

section	.data
arreglo_1 db 2,1,5,1,5,0,0,0,0,0
arreglo_2 db 8,4,3,2,0,0,0,0,0,0

N equ 10

section	.text

	global _start       ;must be declared for using gcc



_start:                     ;tell linker entry point

   
    

    
    mov ebx, arreglo_1
    mov ecx, N
    call capturar

    call salto

    mov ebx, arreglo_2
    mov ecx, N
    call capturar

    call salto
    call salto

    mov esi, arreglo_1
    mov edi, arreglo_2
    mov ecx, N
    call escalar

    call salto
    call salto

    mov ebx, arreglo_1
    mov edx, arreglo_2
    mov ecx, N
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

    ;------------------------ Punto a)----------------------- 
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
    loop cap
    ret


    ;------------------------ Punto b)----------------------- 
    imprimir:
        leer:
            mov byte al, [ebx]
            call pHex_b
            inc ebx
            call salto
        loop leer
    ret

    ;------------------------ Punto c)-----------------------
    sumar:
        sum:
        mov byte al, [ebx]
        add al, [edx]
        mov [ebx], al
        inc ebx
        inc edx
        loop sum
    ret

    ;------------------------- Punto d)----------------------------
    escalar:
        

        sums:
            mov bl, [esi]
            mov al, [edi]
            mul bl
            add dx, ax
            inc edi
            inc esi
        loop sums
        mov ax, dx
        call pHex_w
    ret

   


