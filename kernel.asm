[BITS 16]
[ORG 8000h]

jmp config

;Definições
TIMER equ 046Ch

;mensagens
CRLF db 10, 13, 0
version db 10, 13, "AFT_OS - versao 0.1", 10, 13, 0
help db 10, 13, 'Comandos:', 10, 13, 'ver, help, clear, time, crono, date, reboot, address, fontcolor', 10, 13, 0
msg1 db "AFT_OS, versao 0.1 - 10/10/2023", 10, 13, 0
dsp_cursor db '>> ', 0
dsp_cmd_invalido db 10, 13, 'Comando invalido! ', 10, 13, 0
tec_exit db 10, 13, 'Pressione qualquer tecla para sair! ', 10, 13, 0
_dsp_fontcolor db 10, 13, 'Selecione uma cor:', 0 
fontec1 db 10, 13, '1 - Azul escuro', 0 
fontec2 db 10, 13, '2 - Verde escuro', 0
fontec3 db 10, 13, '3 - Cian escuro', 0 
fontec4 db 10, 13, '4 - Vermelho escuro', 0 
fontec5 db 10, 13, '5 - Magenta escuro', 0 
fontec6 db 10, 13, '6 - Amarelo escuro', 0 
fontec7 db 10, 13, '7 - Brannco escuro', 0 
fontec8 db 10, 13, '8 - Cinza escuro', 0 
fontec9 db 10, 13, '9 - Azul claro', 0 
fontec10 db 10, 13, 'A - Verde claro', 0 
fontec11 db 10, 13, 'B - Cian claro', 0 
fontec12 db 10, 13, 'C - Vermelho claro', 0 
fontec13 db 10, 13, 'D - Magenta claro', 0 
fontec14 db 10, 13, 'E - Amarelo claro', 0 
fontec15 db 10, 13, 'F - Branco claro', 0
fontecNDA db 10, 13, '16 - Nenhuma das opcoes anteriores', 10, 13, 0

_dsp_address: db 10, 13, "Address: ", 0

;comandos
dsp_ver db 'ver', 0
tam_dsp_ver equ $- dsp_ver

dsp_help db 'help', 0
tam_dsp_help equ $- dsp_help

dsp_clear db 'clear', 0
tam_dsp_clear equ $- dsp_clear

dsp_time db 'time', 0
tam_dsp_time equ $- dsp_time

dsp_crono db 'crono', 0
tam_dsp_crono equ $- dsp_crono

dsp_date db 'date', 0
tam_dsp_date equ $- dsp_date

dsp_reboot db 'reboot', 0
tam_dsp_reboot equ $- dsp_reboot

dsp_address db 'address', 0
tam_dsp_address equ $- dsp_address

dsp_fontcolor db 'fontcolor', 0
tam_dsp_fontcolor equ $- dsp_fontcolor

n_caracteres resb 1	    ;conta o número de caracteres

color db 10             ;cor da fonte


;Buffers
bufferv: resb 50    	;Buffer de vídeo
buffert: resb 50    	;Buffer do teclado
num: resw 1

config:
                        
	;Configura o vídeo
	mov ah, 00h         	;modo de tela
	mov al, 03h         	;modo texto 80x25 colorido
	int 10h

	;mov ah, 05h		;Select Active Display Page
	;mov al, 00h		;página 0
	;int 10h

    call colorfont

 	;Boot e Kernell carregados!
	mov si, msg1        
	call string_print


;################################################
; Programa principal
;################################################
inicio:

	;Cursor
    mov si, dsp_cursor
	call string_print

	;lê uma string
    mov di, buffert
    call string_read

;--> comando ver
__cmd_ver:
    mov si, dsp_ver
    mov di, buffert
    mov cx, tam_dsp_ver
    cld
    repe cmpsb
    jecxz _cmd_ver
	jmp __cmd_help
_cmd_ver:
	jmp cmd_ver

;--> comando help
__cmd_help:
    mov si, dsp_help
    mov di, buffert
    mov cx, tam_dsp_help
    cld
    repe cmpsb
    jecxz _cmd_help
	jmp __cmd_clear
_cmd_help:
	jmp cmd_help

;--> comando clear
__cmd_clear:
    mov si, dsp_clear
    mov di, buffert
    mov cx, tam_dsp_clear
    cld
    repe cmpsb
    jecxz _cmd_clear
	jmp __cmd_time
_cmd_clear:
	jmp cmd_clear

;--> comando time
__cmd_time:
    mov si, dsp_time
    mov di, buffert
    mov cx, tam_dsp_time
    cld
    repe cmpsb
    jecxz _cmd_time
	jmp __cmd_crono
_cmd_time:
	jmp cmd_time

;--> comando crono
__cmd_crono:
    mov si, dsp_crono
    mov di, buffert
    mov cx, tam_dsp_crono
    cld
    repe cmpsb
    jecxz _cmd_crono
	jmp __cmd_date
_cmd_crono:
	jmp cmd_crono

;--> comando date
__cmd_date:
    mov si, dsp_date
    mov di, buffert
    mov cx, tam_dsp_date
    cld
    repe cmpsb
    jecxz _cmd_date
	jmp __cmd_reboot
_cmd_date:
	jmp cmd_date

;--> comando reboot
__cmd_reboot:
    mov si, dsp_reboot
    mov di, buffert
    mov cx, tam_dsp_reboot
    cld
    repe cmpsb
    jecxz _cmd_reboot
	jmp __cmd_address
_cmd_reboot:
	jmp cmd_reboot

;--> comando address
__cmd_address:
    mov si, dsp_address
    mov di, buffert
    mov cx, tam_dsp_address
    cld
    repe cmpsb
    jecxz _cmd_address
	jmp __cmd_fontcolor
_cmd_address:
	jmp cmd_address

;--> comando fontcolor
__cmd_fontcolor:
    mov si, dsp_fontcolor
    mov di, buffert
    mov cx, tam_dsp_fontcolor
    cld
    repe cmpsb
    jecxz _cmd_fontcolor
	jmp __cmd_invalido
_cmd_fontcolor:
	jmp cmd_fontcolor

;--> comando inválido
__cmd_invalido:
    mov si, dsp_cmd_invalido
	call string_print

	jmp inicio


;#################################################
; Área de rotinas do sistema
;#################################################

%include "./sub/string_print.asm"
%include "./sub/colorfont.asm"
%include "./sub/delay.asm"
%include "./sub/cursor.asm"
%include "./sub/string_read.asm"
%include "./sub/string_hexa.asm"
%include "./sub/hexa_string.asm"

;#################################################
; Área de comandos
;#################################################

%include "./cmd/ver.asm"
%include "./cmd/help.asm"
%include "./cmd/clear.asm"
%include "./cmd/time.asm"
%include "./cmd/crono.asm"
%include "./cmd/date.asm"
%include "./cmd/reboot.asm"
%include "./cmd/address.asm"
%include "./cmd/fontcolor.asm"

;-------------------------------------------------
times 2048 - ($-$$) db 0