%include "util.asm"
section .data
    strResult db '000000'
    rlen equ $ - strResult
    nl db 0xa
    len1 equ $ - nl
    num1 dq 123


section .text
    global _start

_start:
    mov eax, [num1]
    shr eax, 1

    call print
    
    mov eax, 1
    int 0x80