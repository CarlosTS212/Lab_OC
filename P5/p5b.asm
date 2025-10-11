%include "../LIB/pc_io.inc"       ; incluir librería externa

section .text
    global _start                 ; punto de entrada

_start:
    mov al, 'X'                   ; carga el carácter 'X'
	mov ebx,23					  ; guardar posicion 23 de x
    mov [msg + ebx], al            ; sobrescribe la letra 23 de msg
    mov edx, msg                  ; pasa la dirección de msg
    call puts                     ; imprime la cadena terminada en 0

    mov eax, 1                    ; llamada al sistema: exit
    int 0x80                      ; fin del programa

section .data
msg db 'abcdefghijklmnopqrstuvwxyz0123456789', 0xa, 0

