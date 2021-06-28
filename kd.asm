bits 16
org 32768
%include "mikedev.inc"

mov si, i_tr
call os_print_string
mov dh, 24
mov dl, 0
call os_move_cursor
mov si, footer
call os_print_string
mov dh, 1
mov dl, 0
call os_move_cursor
mov ax, input
mov bx, 80
call os_input_string
call os_print_newline
mov si, input
jmp lp
lp:
	pusha
	mov ah, 0Eh

.tekrar:
	lodsb
	cmp al, 0
	je .done

	cmp al, 'a'
	je .sesli
	cmp al, 'e'
	je .sesli
	cmp al, 'i'
	je .sesli
	cmp al, 'u'
	je .sesli
	cmp al, 'o'
	je .sesli
	int 10h
	jmp .tekrar

.sesli:
	int 10h
	pusha
	mov al, 'g'
    int 10h
	popa
	int 10h
    jmp .tekrar

.done:
	call os_print_newline
	call os_wait_for_key
	ret

input times 80 db 0
i_tr db 'Turkce metin girin (en fazla 80 karakter):', 0
footer db 'GH: Comrade-Otaku/kd-mikeos                                     Made by Camroku', 0