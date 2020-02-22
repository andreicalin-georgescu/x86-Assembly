%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power

    ; TODO - print the powers of 2 that generate number stored in EAX
loop:
    cmp eax, ebx
    jl return
    mov ecx, eax
    and eax, ebx
    jnz print
loop1:
    mov eax, ecx
    shl ebx, 1
    jmp loop
print:
    PRINT_DEC 4, ebx
    NEWLINE
    jmp loop1
return:
    leave ;de ce fara asta aici da seg fault??
    ret
