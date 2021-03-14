; Given a positive number, write ALP for verifying 
; whether it is an Armstrong number or not,
; and display the result as the output.
%include "util.asm"

section .data
	msg1 db "Affirmitive"
	len1 equ $ - msg1

	msg2 db "Negative"
	len2 equ $ - msg2

	num dq 10
	sum dq 0

section .text
	global _start

_start:
	mov eax, [num]
	

exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
