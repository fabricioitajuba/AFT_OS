;-------------------------------------------------
; comando date
; mostra a data do sistema
;------------------------------------------------
cmd_date:

	mov si, CRLF
	call string_print

	mov si, bufferv

	mov ah, 04h
	int 1ah

	;plota dia
	mov al, dl
	push ax
	shr al, 4
	and al, 0fh
	add al, '0'
	mov [si], al
	inc si

	pop ax
	and al, 0fh
	add al, '0'
	mov [si], al
	inc si

	mov al, '/'
	mov [si], al
	inc si

	;plota mês
	mov al, dh
	push ax
	shr al, 4
	and al, 0fh
	add al, '0'
	mov [si], al
	inc si

	pop ax
	and al, 0fh
	add al, '0'
	mov [si], al
	inc si

	mov al, '/'
	mov [si], al
	inc si

	;plota ano
	mov al, cl
	push ax
	shr al, 4
	and al, 0fh
	add al, '0'
	mov [si], al
	inc si

	pop ax
	and al, 0fh
	add al, '0'
	mov [si], al
	inc si

	mov si, bufferv
	call string_print

	mov si, CRLF
	call string_print

	jmp inicio
