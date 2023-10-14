;------------------------------------------------
; String Read
; Lê uma string digitada pelo teclado
; di = Buffer da string
;------------------------------------------------
string_read:

	mov al, 00h
	mov [n_caracteres], al

string_read_loop:

	mov ah, 00h             ;serviço 0 - leitura de caracter
	int 16h                 ;no teclado e guarda em al

	cmp al, 0dh             ;compara o caracter com ENTER
	je  string_read_exit    ;salta para fim caso seja igual

	cmp al, 08h             ;compara o caracter com BACKSPACE
	je  key_backspace       ;salta para fim caso seja igual

	mov ah, 0Eh             ;imprime o caracter
	int 10h                 ;na tela

	mov [di], al            ;guarda o caracter na primeira posição de buffer
	inc di

	mov al, [n_caracteres]
	inc al
	mov [n_caracteres], al

	jmp string_read_loop

key_backspace:

	mov al, [n_caracteres]
	test al, al
	jz string_read	

	mov al, [n_caracteres]
	dec al
	mov [n_caracteres], al

	mov ah, 03h		;Read Cursor Position	
	mov bh, 00h		;Return dh = row | dl = column
	int 10h

	dec dl			;decrementa a atual posição do cursor

	mov ah, 02h		;INT 10,2 - Set Cursor Position
	mov bh, 00h
	int 10h

	mov ah, 0eh		;Limpa a atual posição do cursor
	mov al, ' '
	int 10h

	mov ah, 03h		;Read Cursor Position	
	mov bh, 00h		;Return dh = row | dl = column
	int 10h

	dec dl			;decrementa a atual posição do cursor

	mov ah, 02h		;INT 10,2 - Set Cursor Position
	mov bh, 00h
	int 10h

	dec di

	jmp string_read_loop

string_read_exit:
	
	inc di
	mov al, 0
	mov [di], al

	ret