%include "io.inc"

section .data
    num dd 100
    print_format1 db "Sum(", 0
    print_format2 db "): ", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    mov ecx, [num]     ; Use ecx as counter for computing the sum.
    xor eax, eax       ; Use eax to store the sum. Start from 0.

add_to_sum:
    ;add eax, ecx
    ;loop add_to_sum    ; Decrement ecx. If not zero, add it to sum.
    ;var 1
   ; mov eax, ecx
   ; mov edx, eax;
   ; mul edx
   ; add ebx, eax
    ;var 2
    mov eax, ecx
    mul eax
    add ebx, eax
    
    ;mov eax, ecx
    loop add_to_sum
    
    mov ecx, [num]
    PRINT_STRING print_format1
    PRINT_UDEC 4, ecx
    PRINT_STRING print_format2
    PRINT_UDEC 4, ebx
    NEWLINE

    leave
    ret
