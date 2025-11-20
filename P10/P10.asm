section .text
    global suma
    global aStrlen
    global getBit



suma:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]     
    add eax, [ebp+12]    

    pop ebp
ret


aStrlen:
    push ebp
    mov ebp, esp

    mov edi, [ebp+8]     
    mov eax, 0           

    strlen_loop:
    cmp byte [edi + eax], 0
    je strlen_fin
    inc eax
    jmp strlen_loop

    strlen_fin:
    pop ebp
ret


getBit:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]    
    mov ecx, [ebp+12]    

    shr eax, cl          
    and eax, 1           

    pop ebp
ret

