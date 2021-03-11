%include "util.asm"
section .data
    msg1 db "The quotient is: "
    mlen1 equ $ - msg1
    msg2 db "The remainder is: "
    mlen2 equ $ - msg2
    strResult db '000000'
    rlen equ $ - strResult
    num1 dq 241
    num2 dq 120
    nl db 0xa
    quo dq 0
    rem dq 0

section .text
    global _start

_start:

    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, mlen1
    int 0x80

    xor edx, edx
    mov eax, [num1]
    mov bx, [num2]
    div bx

    mov [rem], edx ; store rem to use later
    call print

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, mlen2
    int 0x80

    mov eax, [rem]
    call print

    mov eax, 1
    int 0x80