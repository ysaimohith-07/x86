; Q2) Choose a random number 20 ≤ R ≤ 100, write ALP by using loops for printing the numbers (i.e. from 1 to
; R) and display the result as the output.


%include "util.asm"
section .data
	num dd 123
	
section .text
	global _start

_start:
loop:
	mov eax, [num]
	call print
	
	mov eax, [num]
	dec eax
	mov [num], eax

	test eax, eax
	jne loop

	mov eax, 1
	mov ebx, 0
	int 0x80
