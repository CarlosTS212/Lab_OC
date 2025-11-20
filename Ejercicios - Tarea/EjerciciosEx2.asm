%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a
section	.data
arreglo_1 db 'Hola mundo',0 


section	.text
	global _start       
	
_start:   
    mov edi, arreglo_1
    call PrintStr

    call salto

    call InvertirStr
    call PrintStr

    call salto

    mov cx, 5
    mov al, 10010010b
    call TestBit



    call salto

    mov edx,24
    call EsPar
    add al,'0'
    call putchar

    call salto

    mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel



salto:
    push eax
    mov al,10
    call putchar
    pop eax
ret


PrintStr:
    push edi
    push eax

    imprimir:
        mov al,[edi]
        call putchar
        inc edi
        cmp byte [edi],0
    jnz imprimir

    pop eax
    pop edi
ret

InvertirStr:
    push edi
    push eax
    push esi

    mov esi, edi
    guardar:
        cmp byte [edi],0
        jz salirGuardar
        mov al,[edi]
        push ax
        inc edi
    jmp guardar
        
    salirGuardar:

    mov edi, esi
    invertirCadena:
        cmp byte [edi],0
        jz salirInvertir
        pop ax
        mov [edi],al
        inc edi
    jmp invertirCadena

    salirInvertir:
    

    pop esi
    pop eax
    pop edi
ret

TestBit:
    push ax
    push cx

    mov ah, al
    inc cl
    shr ah, cl

    jc Activado
    mov al, "0"
    call putchar
    jmp Fin
    Activado:
        mov al, "1"
        call putchar
    Fin:

    pop cx
    pop ax

ret

EsPar:
    push edx

    and edx,0x0001
    cmp edx,0x1
    jz esImpar
        mov al,1
        pop edx
    ret

    esImpar:
        mov al,0
        pop edx
ret



	


