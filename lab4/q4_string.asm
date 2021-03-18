%include "util.asm"
; print string
   %macro write_string 2 
      mov   eax, 4
      mov   ebx, 1
      mov   ecx, %1
      mov   edx, %2
      int   0x80
   %endmacro

section .data
    msg1 db "words: "
    len1 equ $-msg1

    msg2 db "characters: "
    len2 equ $-msg2

    msg3 db "vowels: "
    len3 equ $-msg3

    msg4 db "consonants: "
    len4 equ $-msg4

    string db "assembly codes are too big"
    len equ $-string

    words dq 0
    chars dq 0
    vowels dq 0
    consonants dq 0

section .text
	global _start

process_space:
	inc edx
	dec ecx
	inc esi

inc_words:
	inc edx
	ret

inc_vowels:
	inc ebx

_start:
	mov ecx, len 	; charachters (non-space)
	mov ebx, 0		; vowel
	mov edx, 0		; words
	mov esi, 0		; consonants

compute:
	mov eax, [string+esi]

	cmp eax, ' '
	je process_space

	cmp al, 'a'
	je vowel
	cmp al, 'e'
	je vowel
	cmp al, 'i'
	je vowel
	cmp al, 'o'
	je vowel
	cmp al, 'u'
	je vowel

	jmp consonants

	vowel:
		call inc_vowels

	inc esi

	loop compute

	; we have the vowels
	mov [vowels], ebx
	
	; get number of consonants
	mov ecx, len
	sub ecx, edx	; subtract the number of spaces
	sub ecx, ebx	; subtract the number of vowels
	mov [consonants], ecx

	; get number of words
	call inc_words 	; process the last word
	mov [words], edx

	; get number of charachters (non-space)
	mov eax, [vowels]
	mov ebx, [consonants]
	add eax, ebx
	mov [chars], eax

	write_string msg1, len1
	mov eax, [words]
	call print_int

	write_string msg2, len2
	mov eax, [chars]
	call print_int

	write_string msg3, len3
	mov eax, [vowels]
	call print_int

	write_string msg4, len4
	mov eax, [consonants]
	call print_int

exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
