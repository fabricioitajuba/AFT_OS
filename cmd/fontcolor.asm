;-------------------------------------------------
; Font Color
; Altera a cor da fonte
;------------------------------------------------

cmd_fontcolor:

	mov si, _dsp_fontcolor
	call string_print

	mov ah, 09h
	mov bh, 00h
	mov bl, 13		;cor
	mov cx, 2000	;80x25
	int 10h

	jmp inicio