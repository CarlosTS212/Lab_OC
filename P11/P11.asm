extern putchar

section .text
    global pBin8b
    global pBin16b
    global pBin32b
    global pBin64b
    global myputchar



pBin8b:
    push ebp
    mov ebp,esp

    mov al,[ebp+8]
    mov ecx, 8
    shl al,1
    Loop_8:
        push ax
        push ecx

        jc Esuno
        mov al,"0"
        call myputchar
        jmp Fin_8

        Esuno:
            mov al,"1"
            call myputchar

        Fin_8:
        pop ecx
        pop ax
        shl al,1
        
    loop  Loop_8

    pop ebp
ret

pBin16b:
    push ebp
    mov ebp,esp

    mov ax,[ebp+8]
    mov ecx, 16
    shl ax,1
    Loop_16:
        push ax
        push ecx

        jc Esuno_16
        mov al,"0"
        call myputchar
        jmp Fin_16

        Esuno_16:
            mov al,"1"
            call myputchar

        Fin_16:
        pop ecx
        pop ax
        shl ax,1
        
    loop  Loop_16

    pop ebp
ret

pBin32b:
    push ebp
    mov ebp,esp

    mov eax,[ebp+8]
    mov ecx, 32
    shl eax,1
    Loop_32:
        push eax
        push ecx

        jc Esuno_32
        mov al,"0"
        call myputchar
        jmp Fin_32

        Esuno_32:
            mov al,"1"
            call myputchar

        Fin_32:
        pop ecx
        pop eax
        shl eax,1
        
    loop  Loop_32

    pop ebp
ret

pBin64b:
    push ebp
    mov ebp,esp

    mov eax,[ebp+8]
    mov ecx, 32
    shl eax,1
    Loop_64_a:
        push eax
        push ecx

        jc Esuno_64_a
        mov al,"0"
        call myputchar
        jmp Fin_64_a

        Esuno_64_a:
            mov al,"1"
            call myputchar

        Fin_64_a:
        pop ecx
        pop eax
        shl eax,1
        
    loop  Loop_64_a
    ;-----------------SEgunda parte-----------
    mov edx,[ebp+12]
    mov ecx, 32
    shl edx,1
    Loop_64_d:
        push edx
        push ecx

        jc Esuno_64_d
        mov al,"0"
        call myputchar
        jmp Fin_64_d

        Esuno_64_d:
            mov al,"1"
            call myputchar

        Fin_64_d:
        pop ecx
        pop edx
        shl edx,1
        
    loop  Loop_64_d

    pop ebp
ret

myputchar:
    push edx
    push ecx
    push eax

    call putchar

    pop eax
    pop ecx
    pop edx
ret




