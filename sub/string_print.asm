;------------------------------------------------
; Imprime uma string na tela
; si ponteiro da string
;------------------------------------------------
string_print:

	call colorfont ;////////////teste

	push ax
	push bx
	push si

	mov ah, 0eh
	mov bh, 00h
	mov bl, 00h
	cld

string_print_loop:

	lodsb
	test al, al
	jz string_print_end
	int 10h
	jmp string_print_loop

string_print_end:

	pop si
	pop bx
	pop ax

	call colorfont ;////////////teste

	ret

