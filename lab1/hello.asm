section .data
	msg db "hello"
	len equ $ - msg

section .text
	global _start

_start:
	stos msg, "ehell"
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, 1
	int 0x80