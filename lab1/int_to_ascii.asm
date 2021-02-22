section .data
    strResult db '000000'
    num dq 131
    msg db "hellow rodl"
    len equ $ - msg

section .text
    global _start

_start:
    mov eax, num
    mov ecx, 10
    xor bx, bx      ; digit counter

divide:
    xor edx, edx
    div ecx         ; eax = edx:eax/ecx, edx = remainder
    push dx         ; single digit
    inc bx          ; digit counter
    test eax, eax   ; is eax 0
    jnz divide      ; no, continue

    ;; eax is now zero
    mov cx, bx      ; bx is num if digits
    mov esi, 6       ; ds:si points to string buffer

next_digit:
    pop ax
    add al, '0'
    mov [strResult+esi], al
    dec esi
    loop next_digit

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, strResult
    mov edx, 6
    int 0x80

    mov eax, 1
    int 0x80