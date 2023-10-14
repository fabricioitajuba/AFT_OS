;------------------------------------------------
; comando ver
; mostra a versão do sistema operacional
;------------------------------------------------
cmd_ver:

	mov si, version 
	call string_print

	jmp inicio