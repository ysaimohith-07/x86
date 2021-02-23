%include "util.asm"
section .data
	msg db "The product is:"
	len equ $ - msg
	nl db 10
	strResult db '000000'
    rlen equ $ - strResult


section .text
	global _start

_start: 
	mov eax, 999
	mov ebx, 999
	mul ebx
	
	call print

	mov eax, 1
	int 0x80

