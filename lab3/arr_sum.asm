; Choose a positive value 5 ≤ P ≤ 20, write ALP by defining a P-element array containing P random values
; and do the sum of these values in the array and display the result as the output.

%include "util.asm"
section .data
	global arr
	len db 6
	msg db "Sum of the array is: "
	mlen equ $ - msg
arr:
	dd 10
	dd 12
	dd 14
	dd 15
	dd 17
	dd 12

section .text
	global _start

_start:
	mov   eax,4
	mov   ebx,1
	mov   ecx, msg
 	mov   edx, mlen
	int   0x80

	mov esi, 6		; pointer
	xor eax, eax	; eax will store the sum

sum_it:
	mov ebx,DWORD [arr+esi*4-4]
	add eax, ebx
	dec esi
	test esi, esi
	jnz sum_it

	call print

	mov eax, 1
	mov ebx, 0
	int 0x80 
