section .data
    strResult db '000000'
    rlen equ $ - strResult
    num dq 421
    nl db 0xa
    len1 equ $ - nl


section .text
    global _start

_start:
    mov eax, [num]

print:
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
    mov esi, eax       ; ds:si points to string buffer

next_digit:
    pop ax
    add al, '0'
    mov [strResult+esi], al
    inc esi
    loop next_digit

    mov eax, 4
    mov ebx, 1
    mov ecx, strResult
    mov edx, rlen
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, 1
    int 0x80

    mov eax, 1
    int 0x80