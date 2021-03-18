; Given a positive number, write ALP for verifying 
; whether it is an Armstrong number or not,
; and display the result as the output.
%include "util.asm"

section .data
	msg1 db "Affirmitive", 0xa, 0xc
	len1 equ $ - msg1

	msg2 db "Negative", 0xa, 0xc
	len2 equ $ - msg2

	num dq 155
	sum dq 0
	digits dq 3
	it dq 0

section .text
	global _start

power:
	mov ecx, [digits]
	mov esi, eax
	mov eax, 1
p_loop:
	dec ecx
	mul esi
	cmp ecx, 0
	jg p_loop
	ret

_start:
	mov eax, [num]
	xor ecx, ecx

div_loop:
	inc ecx
	mov esi, 10
	xor edx, edx
	idiv esi
	push edx
	cmp eax, 0
	jnz div_loop

	mov [digits], ecx
	mov [it], ecx
sum_it:
	; decrement it
	mov ecx, [it]
	dec ecx
	mov [it], ecx
	; perform power and addition
	pop eax
	call power
	add [sum], eax

	mov ecx, [it]
	cmp ecx, 0
	jnz sum_it

	mov eax, [sum]

check:
	mov eax, [sum]
	mov ebx, [num]
	cmp eax, ebx
	jne negative

affirmitive:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, len1
	int 0x80
	jmp exit

negative:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len2
	int 0x80
	ret

exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
