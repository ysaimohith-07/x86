;; add two three digit numbers

section .data
	msg db "The diff is:"	; prompt
	len equ $-msg

	nl db 0xa				; new line charachter

	num1 db '423'
	num2 db '267'
	diff db '000'

section .text
	global _start

_start:
	;; add the numbers
	mov esi, 2 				; index from the end
	mov ecx, 3				; iterations
	clc 					; initialise the carry flag

sub_num:
	mov al, [num1+esi]		; mov [esi]th index of num1 to al
	sbb al, [num2+esi]		; sub [esi]th index of num2 to al
	aas 					; ASCII adjust after subtraction 
	pushf
	or al, 30h
	popf
	mov [diff+esi], al		; set the digit
	dec esi					; decrement the counter
	loop sub_num
    
	;; print the prompt
	mov eax, 4				; syscall (sys_write)
	mov ebx, 1				; file descriptor (stdout)
	mov ecx, msg 			; content to write
	mov edx, len 			; num of bytes to write
	int 0x80				; call kernel

	mov eax, 4				; syscall (sys_write)
	mov ebx, 1				; file descriptor (stdout)
	mov ecx, diff 			; content to write
	mov edx, 3 				; num of bytes to write
	int 0x80				; call kernel

	mov eax, 4				; syscall (sys_write)
	mov ebx, 1				; file descriptor (stdout)
	mov ecx, nl 			; content to write
	mov edx, 1	 			; num of bytes to write
	int 0x80				; call kernel

	mov eax, 1				; syscall (sys_exit)
	int 0x80				; call kernel
