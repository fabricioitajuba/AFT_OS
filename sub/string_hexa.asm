;-------------------------------------------------------------
;Rotina de conversão de string para hexadecimal
; si - ponteiro da string hexa
; di - ponteiro do número a ser convertido
;-------------------------------------------------------------
string_hexa:

	push ax
	push bx
	push cx
	push dx
	push si
	push di

	xor ax, ax
	mov [di], ax

string_hexa_p2:

	mov al, [si]
	cmp al, 0
	je string_hexa_fim

	sub al, '0'
	cmp al, 09h
	jle string_hexa_p1
	sub al, 07h

string_hexa_p1:

	push ax
	mov bx, 10h
	mov ax, [di]
	mul bx
	mov [di], ax
	pop ax
	or [di], al
	inc si
	jmp string_hexa_p2		

string_hexa_fim:

	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax

	ret
