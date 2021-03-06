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

    mov ecx, 5
zero_strResult:
    mov byte [strResult+ecx], "0"
    loop zero_strResult

    ret
