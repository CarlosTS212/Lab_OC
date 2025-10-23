%include "../LIB/pc_iox.inc"

extern pBin_n
extern pBin_b
extern pBin_w
extern pBin_dw

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

   
    ; Punto a)
    mov eax, 0x22446688
    ror eax,4
    call pHex_dw


    mov al,10
    call putchar
    call putchar

    ; Punto b)
    mov cx, 0x3F48
    shl cx,4
    mov ax,cx
    call pHex_w 

    mov al,10
    call putchar
    call putchar

    ;call Punto c)
    mov esi, 0x20D685F3
    mov ebx, 0x40042021
    mov eax, esi
    call pBin_dw

    mov al,10
    call putchar

    xor esi,ebx
    mov eax,esi
    call pBin_dw

    mov al,10
    call putchar
    call putchar

    ; Punto d)
    push esi
    mov eax,esi
    call pBin_dw

    mov al,10
    call putchar
    call putchar

    ;punto e)
    mov ch, 0xA7
    mov bh, 0x48
    or ch, bh
    mov al, ch
    call  pBin_b

    mov al,10
    call putchar
    call putchar

    ;Punto f)
    mov bp, 0x67DA
    mov cx, 0xBBAD
    and bp, cx
    mov ax, bp
    call pBin_w 
    
    mov al,10
    call putchar
    call putchar

    ;Punto g)
    shr bp, 3
    mov ax, bp
    call pBin_w

    mov al,10
    call putchar
    call putchar


    ;Punto h)
    mov ebx, 0x22446688
    shr ebx, 5
    mov eax, ebx
    call pBin_dw

    mov al,10
    call putchar
    call putchar

    ; Punto i)

    mov cx, 0xFA40;
    shl cx, 3
    mov ax, cx
    call pBin_w

    mov al,10
    call putchar
    call putchar

    ;Punto j)
    pop esi
    mov eax, esi
    call pBin_dw

    mov al,10
    call putchar
    call putchar

    ; Punto k)
    shl esi, 3
    mov eax, esi
    call pBin_dw

    mov al,10
    call putchar
    call putchar


	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel