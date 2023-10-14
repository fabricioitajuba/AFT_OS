;------------------------------------------------
; comando clear
; limpa a tela
;------------------------------------------------
cmd_clear:

	push ax

    mov ah, 00h         ;modo de tela
    mov al, 03h         ;modo texto 80x25 colorido
    int 10h

	pop ax

	jmp inicio