%include "io.inc"

section .data

%define ARRAY_LEN 7

    input dd 122, 184, 199, 242, 263, 845, 911
    output times ARRAY_LEN dd 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor ecx, ecx
    
    ; TODO push the elements of the array on the stack
push_array:
    push dword [input + 4 * (ecx)]
    inc ecx
    cmp ecx, ARRAY_LEN
    jl push_array
    
    ; TODO retrieve the elements (pop) from the stack into the output array
    xor ecx, ecx
pop_array:
    pop dword [output + 4 * ecx]
    inc ecx
    cmp ecx, ARRAY_LEN
    jl pop_array
    
    PRINT_STRING "Reversed array:"
    NEWLINE
    xor ecx, ecx
print_array:
    PRINT_UDEC 4, [output + 4 * ecx]
    NEWLINE
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array

    xor eax, eax
    ret
