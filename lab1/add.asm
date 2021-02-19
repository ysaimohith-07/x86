;; add two three digit numbers

section .data
	msg db "The sum is:"	; prompt
	len equ $-msg

	nl db 0xa				; new line charachter

	num1 db '267'
	num2 db '499'
	sum db '000'

section .text
	global _start

_start:
	;; add the numbers
	mov esi, 2 				; index from the end
	mov ecx, 3				; iterations
	clc 					; initialise the carry flag

add_num:
	mov al, [num1+esi]		; mov [esi]th index of num1 to al
	adc al, [num2+esi]		; add [esi]th index of num2 to al
	aaa 					; ASCII adjust after addition
	pushf
	or al, 30h
	popf
	mov [sum+esi], al		; set the digit
	dec esi					; decrement the counter
	loop add_num
    
	;; print the prompt
	mov eax, 4				; syscall (sys_write)
	mov ebx, 1				; file descriptor (stdout)
	mov ecx, msg 			; content to write
	mov edx, len 			; num of bytes to write
	int 0x80				; call kernel

	mov eax, 4				; syscall (sys_write)
	mov ebx, 1				; file descriptor (stdout)
	mov ecx, sum 			; content to write
	mov edx, 3 				; num of bytes to write
	int 0x80				; call kernel

	mov eax, 1				; syscall (sys_exit)
	int 0x80				; call kernel
