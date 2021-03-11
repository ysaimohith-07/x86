; Q2) Choose a random number 20 ≤ R ≤ 100, write ALP by using loops for printing the numbers (i.e. from 1 to
; R) and display the result as the output.


%include "util.asm"
section .data
	num dd 123
	
section .text
	global _start

_start:
loop:
	mov eax, [num]	; print the number
	call print

	mov eax, [num] 	; store the number in eax
	dec eax			; decrement the number
	mov [num], eax	; mov the number back into num

	test eax, eax	
	jne loop 		; if eax != 0 loop

	; gracefull exit
	mov eax, 1
	mov ebx, 0
	int 0x80
