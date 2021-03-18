; palindrome number 
%include "util.asm"

section .data
	msg1 db "Affirmitive", 0xa, 0xc
	len1 equ $ - msg1

	msg2 db "Negative", 0xa, 0xc
	len2 equ $ - msg2

	num dq 151
	rev_num dq 0
	digits dq 3
	it dq 0

section .text
	global _start

_start:
	mov eax, [num]
	xor ecx, ecx

div_loop:
	inc ecx
	mov esi, 10
	xor edx, edx
	idiv esi
	push edx
	cmp eax, 0
	jnz div_loop

	xor edx, edx
	mov esi, 1
	mov ebx, 1
create_rev_number:
	dec ecx
	mov eax, esi
	imul ebx
	mov esi, eax
	mov ebx, 10
	pop eax
	imul esi
	mov edx, [rev_num]
	add edx, eax
	mov [rev_num], edx
	cmp ecx, 0
	jnz create_rev_number

check:
	mov eax, [num]
	cmp eax, edx
	jne negative

affirmitive:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, len1
	int 0x80
	jmp exit

negative:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len2
	int 0x80
	ret

exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
