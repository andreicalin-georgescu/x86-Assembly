%include "io.inc"

section .text
global CMAIN
CMAIN:
    ; cele doua numere se gasesc in eax si ebx
    mov eax, 4
    mov ebx, 5
    
    ; TODO: aflati maximul folosind doar o instructiune de salt si push/pop
    cmp eax, ebx
    jg print
    push eax
    push ebx
    
    pop eax
    pop ebx
print:
    PRINT_DEC 4, eax ; afiseaza minimul
    NEWLINE

    ret
