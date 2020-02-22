%include "io.inc"

%define ARRAY_SIZE    10
;cum aflu dimm unui vector??????

section .data
    dword_array dd 1392, -12544, 7992, -6992, 7202, 27187, 28789, 17897, 12988, -17992
    print_p dd 'Nr pozitive este: ', 0
    print_n dd 'Nr negative este: ', 0
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp
    
    mov eax, 0
    mov ebx, 0
    mov edx, 0
    mov ecx, ARRAY_SIZE
    
loop_find:
    cmp edx, dword [dword_array + 4 * (ecx - 1)]
    jg incr_p
    jl incr_n
incr_p:
    inc eax
    loop loop_find
incr_n:
    inc ebx
    loop loop_find
    
    PRINT_STRING print_n
    PRINT_DEC 4, EAX
    NEWLINE
    PRINT_STRING print_p
    PRINT_DEC 4, EBX
    
    xor eax, eax
    leave
    ret