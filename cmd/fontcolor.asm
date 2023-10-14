;-------------------------------------------------
; Font Color
; Altera a cor da fonte
;------------------------------------------------

cmd_fontcolor:

	mov si, _dsp_fontcolor
	call string_print

	jmp inicio