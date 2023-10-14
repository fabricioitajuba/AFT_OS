;------------------------------------------------
; comando help
; mostra todos os comandos
;------------------------------------------------
cmd_help:

	mov si, help 
	call string_print

	jmp inicio