colorfont:

    push ax
    push bx
    push cx

    mov ah, 09h
    mov al, ' '
	mov bh, 00h
	mov bl, [color]
	mov cx, 2080
	int 10h

    pop cx
    pop bx
    pop ax

    ret