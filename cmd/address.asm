;-------------------------------------------------
; comando address
; verifica uma possição de memória
;------------------------------------------------
cmd_address:

	;mov si, _dsp_address
	;call string_print

	mov si, CRLF
	call string_print

	;lê o endereço 2 bytes
	mov di, buffert
	call string_read

	;espaço
	mov ah, 0eh
	mov al, ':'
	int 10h

	;converte a string em hexa
	mov si, buffert
	mov di, num
	call string_hexa

	;carrega o dado no endereço
	mov bx, [num]
	mov al, [bx]
	
	;converte o dado para string
	mov dx, 1
	mov si, bufferv
	call hexa_string

	;mostra o dado
	mov si, bufferv
	call string_print

	mov si, CRLF
	call string_print

	jmp inicio