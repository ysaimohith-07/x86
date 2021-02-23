section .text
	global _start

_start: 
	mov eax, 999
	mov ebx, 999
	mul ebx
	
	;; convert eax from integer to ascii
    mov ecx, 10
    xor bx, bx      ; digit counter

divide:
    xor edx, edx
    div ecx         ; eax = edx:eax/ecx, edx = remainder
    push dx         ; single digit
    inc bx          ; digit counter
    test eax, eax   ; is eax 0
    jnz divide      ; no, continue

    ;; length adjust
    xor eax, eax
    mov ax, rlen
    sub ax, bx

    ;; eax is now zero
    mov cx, bx      ; bx is num if digits
    mov esi, eax    ; ds:si points to string buffer

next_digit:
    pop ax
    add al, '0'
    mov [strResult+esi], al
    inc esi
    loop next_digit


print:
	mov ecx, msg
	mov edx, len
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, strResult
	mov edx, rlen
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
	strResult db '000000'
    rlen equ $ - strResult
