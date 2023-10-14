;------------------------------------------------
; Delay
; Gera um delay
;------------------------------------------------
delay:

	push bx

	mov bx, [TIMER]
	add bx, 5

delay_loop:
	cmp [TIMER], bx
	jl delay_loop

	pop bx

	ret