; Choose a positive value 5 ≤ P ≤ 20, write ALP by defining a P-element array containing P random values
; and do the sum of these values in the array and display the result as the output.

%include "util.asm"
section .data
	global arr
	len db 6
	msg db "Sum of the array is: "
	mlen equ $ - msg
arr:				; declare the array
	dd 10
	dd 12
	dd 14
	dd 15
	dd 17
	dd 12

section .text
	global _start

_start:
	; print the message
	mov   eax,4
	mov   ebx,1
	mov   ecx, msg
 	mov   edx, mlen
	int   0x80

	; prepare for the loop
	mov esi, 6		; pointer
	xor eax, eax	; eax will store the sum

sum_it:
	mov ebx,DWORD [arr+esi*4-4] ; move the data from current index to ebx
	add eax, ebx	; add the data to sum
	dec esi			; move the esi back
	test esi, esi
	jnz sum_it		; move up if esi != 0

	;; loop translates to following c code

	; int esi = 6;
	; int eax = 0;
	; while(esi!=0) {
	; 	ebx = arr[esi-1]
	; 	eax += ebx;
	; 	esi--;
	; }

	; print the number stored in esi with help of print section in util.asm
	call print

	; gracefull exit
	mov eax, 1
	mov ebx, 0
	int 0x80 
