section	.data


global suma


section	.text
	                
	
mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel


suma:
    push ebp
    mov ebp,esp

    mov eax,[ebp+8]
    add eax,[ebp+12]

    pop ebp
ret

strlen:
    push ebp
    mov ebp,esp
    
    mov edi,ebp+8
    


    pop ebp
ret

