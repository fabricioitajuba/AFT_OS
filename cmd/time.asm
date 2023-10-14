;------------------------------------------------
; comando time
; mostra a hora do sistema
;------------------------------------------------
cmd_time:

	mov si, CRLF
	call string_print

	;Hora do sistema
	mov ah, 02h
	int 1ah

	mov si, bufferv

	;hora
	mov al, ch
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

	mov al, ':'
	mov [si], al
	inc si   

	;plota minutos
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

	mov al, ':'
	mov [si], al
	inc si 

	;plota segundos
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

	mov si, bufferv
	call string_print

	mov si, CRLF
	call string_print

	jmp inicio