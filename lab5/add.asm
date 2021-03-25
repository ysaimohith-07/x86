%include "util.asm"
section .data
    msg db "The sum is: "
    mlen equ $ - msg
    nl db 0xa
    nlen equ $ - nl
    num1 dq 52
    num2 dq 32
    arr dq 52, 32

section .bss
    num3 resb 4

section .text
    global _start

direct:
    mov eax, [num1]
    add [num2], eax
    mov eax, [num2]
    ret

indirect:
    mov dword [num3], num2  ; set num3 as the address of num2
    mov eax, [num3]         ; mov the content (stored address) 
    mov ebx, [eax]          ; add to ebx, the content form the address stored in eax
    add [num1], ebx
    mov eax, [num1]
    ret

immediate:
    add dword [num1], 32
    mov eax, [num1]
    ret

direct_offset:
    mov eax, [arr]
    add eax, [arr + 8]
    ret

relative:
    mov dword [num3], num2  ; 
    mov ecx, num3
    mov ebx, [num3]
    mov eax, [ebx]
    add eax, [num1]
    ret

indexed:
    mov ecx, arr
    mov eax, [ecx]
    add eax, [ecx + 8]
    ret

register:
	mov eax, [num1]
	mov ebx, [num2]
	add eax, ebx
    ret

register_indirect:
	mov eax, [num1]
	mov ebx, num2
	add eax, [ebx]
    ret

auto_increment:
    mov ebx, 8
    mov ecx, arr
    mov eax, [ecx]
    
    auto_inc:
        add eax, [ecx + ebx]
        add ebx, 8
        cmp ebx, 32
        jne auto_inc
    ret

auto_decrement:
    mov ebx, 16
    mov ecx, arr
    mov eax, [ecx + 24]
    
    auto_dec:
        add eax, [ecx + ebx]
        sub ebx, 8
        cmp ebx, -8
        jne auto_dec
    ret

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, mlen
    int 0x80

select_mode:
    call direct
    call indirect
    call immediate
    call direct_offset
    call relative
    call indexed
    call register
    call register_indirect
    call auto_increment
    call auto_decrement

exit:
    call print_int

    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, nlen
    int 0x80

    mov eax, 1
    int 0x80
