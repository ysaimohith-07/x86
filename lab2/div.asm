%include "util.asm"
section .data
    strResult db '000000'
    rlen equ $ - strResult
    nl db 0xa
    len1 equ $ - nl
    num1 dq 483
    num2 dq 12
    quo dq 0
    rem dq 0

section .text
    global _start

_start:
    mov eax, [num1]
    mov bx, [num2]
    div bx

    mov [rem], edx
    call print

    mov eax, [rem]
    call print

    mov eax, 1
    int 0x80