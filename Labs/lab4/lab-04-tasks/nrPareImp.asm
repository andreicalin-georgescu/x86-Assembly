%include "io.inc"

%define ARRAY_SIZE    10

section .data
;?????????????????????????/////////
;1 Cum fac cu dd impartirea
;2 Unde mai puteam pune loop loop_ip cu/fara leave
    ;dword_array dd 1392, 12544, 7992, 6992, 7202, 27187, 28789, 17897, 12988, 17992
    byte_array db 13, 2, 4, 6, 7, 9, 11, 34, 35, 21
    print_p dd 'Nr pare este: ', 0
    print_n dd 'Nr impare este: ', 0
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp
    
    xor eax, eax
    mov ebx, 0
    mov edx, 0
    mov ecx, ARRAY_SIZE
    
loop_ip:
    mov al, byte [byte_array + ecx - 1]
    mov bl, byte 2
    div bl
    cmp ah, 0
    je inc_pare
    jne inc_impare
    
inc_pare:
    inc ebx
    loop loop_ip
    
inc_impare:
    inc edx
    loop loop_ip
    
    PRINT_STRING print_n
    PRINT_DEC 4, EDX
    NEWLINE
    PRINT_STRING print_p
    PRINT_DEC 4, EBX
    
    leave
    xor eax, eax
    ret