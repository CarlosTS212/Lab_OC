%include "../LIB/pc_io.inc"       ; incluir librería externa

section .text
    global _start                 ; punto de entrada

_start:
	mov ebx, 3	
    mov esi, 4			  
    mov byte[msg + ebx + esi*4], '%'        
    mov edx, msg                  
    call puts                     

    mov eax, 1                    ; llamada al sistema: exit
    int 0x80                      ; fin del programa

section .data
msg db 'abcdefghijklmnopqrstuvwxyz0123456789', 0xa, 0