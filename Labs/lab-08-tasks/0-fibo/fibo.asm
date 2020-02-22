%include "io.inc"

%define NUM_FIBO 10

section .text
global CMAIN
CMAIN:
    mov ebp, esp

    ; TODO - replace below instruction with the algorithm for the Fibonacci sequence
    
    push 1
    push 1
    mov esi, NUM_FIBO - 2
loop:
    mov eax, [esp]
    add eax, [esp + 4]
    push eax
    dec esi
    jnz loop

    mov ecx, NUM_FIBO
print:
    PRINT_UDEC 4, [esp + (ecx - 1) * 4]
    PRINT_STRING " "
    dec ecx
    test ecx, ecx
    ja print

    mov esp, ebp
    xor eax, eax
    ret