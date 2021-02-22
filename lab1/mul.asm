section .text
	global _start

_start: 
	mov eax, 120
	mov ebx, 2
	mul ebx
	mov ebx, eax
	
	; the mul result is stored in the form ebx:eax
	mov [prd], eax

	mov ecx,msg
	mov edx, len
	mov ebx,1
	mov eax,4
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, prd
	mov edx, 4
	int 0x80

	mov ecx, nl
	mov edx, 1
	mov ebx,1
	mov eax,4
	int 0x80

	mov eax, 1
	int 0x80


section .data
	msg db "The product is:"
	len equ $ - msg
	nl db 10

segment .bss
	prd resb 2