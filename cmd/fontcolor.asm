;-------------------------------------------------
; Font Color
; Altera a cor da fonte
;------------------------------------------------

;0-preto
;1-azul escuro
;2-verde escuro
;3-cian escuro
;4-vermelho escuro
;5-magenta escuro
;6-amarelo escuro
;7-branco escuro
;8-cinza escuro
;9-azul claro
;10-verde claro
;11-cian claro
;12-vermelho claro
;13-magenta claro
;14-amarelo claro
;15-branco claro

cmd_fontcolor:

	mov si, _dsp_fontcolor
	call string_print

	mov si, fontec1
	call string_print

	mov si, fontec2
	call string_print

	mov si, fontec3
	call string_print

	mov si, fontec4
	call string_print

	mov si, fontec5
	call string_print

	mov si, fontec6
	call string_print

	mov si, fontec7
	call string_print			

	mov si, fontec8
	call string_print

	mov si, fontec9
	call string_print

	mov si, fontec10
	call string_print

	mov si, fontec11
	call string_print

	mov si, fontec12
	call string_print

	mov si, fontec13
	call string_print

	mov si, fontec14
	call string_print

	mov si, fontec15
	call string_print

	mov si, fontecNDA
	call string_print

	;lê 1 ou 2 bytes
	;mov di, buffert
	;call string_read

	;converte a string em hexa
	;mov si, buffert
	;mov di, color
	;call string_hexa

	mov ah, 00h
	int 16h

	sub al, '0'
	jle fontcolor_ajuste
	sub al, 07h

fontcolor_ajuste:

	mov [color], al

	call colorfont

	jmp inicio