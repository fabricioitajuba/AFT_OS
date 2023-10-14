;------------------------------------------------
; comando crono
; mostra a hora do sistema atualizada
;------------------------------------------------
cmd_crono:

	call cursor_disable

	mov si, tec_exit
	call string_print

cmd_crono_loop:

	;Verifica se uma tecla foi pressionada
	mov ah, 01h
	int 16h
	jnz cmd_crono_fim

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

	call carriage_return
	call delay

	jmp cmd_crono_loop

cmd_crono_fim:

	mov si, CRLF
	call string_print

	call cursor_enable

	jmp inicio