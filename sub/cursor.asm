;------------------------------------------------
; Carriage return
; Retorna o cursor para a primeira coluna
;------------------------------------------------
carriage_return:

	push ax

	mov ah, 0eh
	mov al, 0dh
	int 10h

	pop ax

	ret

;------------------------------------------------
; Cursor enable
; Habilita o cursor
;------------------------------------------------
cursor_enable:

	push ax
	push cx

	mov ah, 01h
	mov ch, 06h 
	mov cl, 07h
	int 10h

	pop cx
	pop ax

	ret

;------------------------------------------------
; Cursor disable
; Desabilita o cursor
;------------------------------------------------
cursor_disable:

	push ax
	push cx

	;Disable cursor
	mov ah, 01h
	mov ch, 3fh
	int 10h

	pop cx
	pop ax

	ret