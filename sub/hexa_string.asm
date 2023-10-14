;-------------------------------------------------------------
;Rotina de conversão de hexadecimal para string
;Entrada: ax o valor em hexadecimal
;         dx o número de bytes
;         si o ponteiro da string
;-------------------------------------------------------------
hexa_string:  

	push ax   
    push bx
    push cx
	push si

    mov bx, ax
    mov cx, dx
loop1:
    mov ax, bx
    and ax, 0xF    ;faz um E lógico com F
    add ax, '0'    ;adiciona 0x30
    cmp ax, '9'    ;compara com 9
    jle digito1     ;se for menor ou igual, salta para digito1
    add ax, 0x7    ;se não, adiciona 7.
digito1:
    push ax        ;guarda o valor convertido na pilha
    shr bx, 4      ;rotaciona 4 bits para a direita
    mov ax, bx
    and ax, 0xF    ;faz um E lógico com F
    add ax, '0'    ;adiciona 0x30
    cmp ax, '9'    ;compara com 9
    jle digito2     ;se for menor ou igual, salta para digito2
    add ax, 0x7    ;se não, adiciona 7.
digito2:
    push ax
    shr bx, 4      ;rotaciona 4 bits para a direita
    dec cx
    cmp cx, 0
    jne loop1
    mov cx, dx
    shl cx, 1      ;multiplica o número de bytes por 2
loop2:
    pop ax
    mov [si], ax
    inc si
    dec cx
    cmp cx, 0
    jne loop2
    mov al, 0
    inc si
    mov [si], al

	pop si
    pop cx
    pop bx
	pop ax

    ret