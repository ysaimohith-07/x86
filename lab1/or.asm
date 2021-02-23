%include "util.asm"
section .data
    strResult db '000000'
    rlen equ $ - strResult
    nl db 0xa
    len1 equ $ - nl
    num1 dq 123
    num2 dq 143


section .text
    global _start

_start:
    mov eax, [num1]
    mov ebx, [num2]
    or eax, ebx

    call print