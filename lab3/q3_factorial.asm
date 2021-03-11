; Write ALP by using recursion for finding a factorial
; of number between 5 and 30 and display the result

%include "util.asm"
section .data
	msg db "Factorial of given number is: "
	mlen equ $ - msg
	num db 10

section .text
	global _start

_start: 
	;; print out the message
	mov   eax,4
	mov   ebx,1
	mov   ecx, msg
 	mov   edx, mlen
	int   0x80

	mov ebx, [num]
	call get_factorial

	call print

	mov eax, 1
	mov ebx, 0
	int 0x80

;; factorial function to create a stack
; first we decrease the number till we get to 1
; and then we increment the number and multiply 
; it to the accumulator with the help of recursion
get_factorial:
	cmp ebx, 1
	jg recurcall
	mov eax, 1
	ret

recurcall:
	dec ebx
	call get_factorial	; build the stack
	inc ebx
	mul ebx
	ret