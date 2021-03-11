; Q1) Choose five numbers between 100 and 999. Write ALP by using conditional instructions for finding the largest
; of these five numbers and display the result as the output.

%include "util.asm"
section .data
	num1 dd 143
	num2 dd 193
	num3 dd 873
	num4 dd 99
	num5 dd 444

	msg db "The max of 5 is: "
	mlen equ $ - msg

section .text
	global _start

_start:
	mov   eax,4
	mov   ebx,1
	mov   ecx, msg
 	mov   edx, mlen
	int   0x80

	
	mov eax, [num1]
	cmp eax, [num2]
	jg compare_third	; num1 < num2
	mov eax, [num2]		; num2 > num1

compare_third:
	cmp eax, [num3]
	jg compare_forth	; num2 < num3
	mov eax, [num3]		; num3 < num2

compare_forth:
	cmp eax, [num4]
	jg compare_fifth	; num2 < num3
	mov eax, [num4]		; num3 < num2


compare_fifth:
	cmp eax, [num5]
	jg exit				; num2 < num3
	mov eax, [num5]		; num3 < num2

exit:	
	call print

	mov eax, 1
	mov ebx, 0
	int 0x80