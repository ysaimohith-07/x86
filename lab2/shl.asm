%include "util.asm"
section .data
    msg db "The shl is: "
    mlen equ $ - msg
    strResult db '000000'
    rlen equ $ - strResult
    num1 dq 522
    nl db 0xa

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, mlen
    int 0x80

    mov eax, [num1]
    shl eax, 3

    call print

    mov eax, 1
    int 0x80