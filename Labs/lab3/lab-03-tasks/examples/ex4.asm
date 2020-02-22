%include "io.inc"
 
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, 5
    mov ebx, 9
    cmp eax, ebx
    ;add ecx, 1   ; Comenteaza aceasta linie
    jns print
    ret
print:
    PRINT_UDEC 4, eax
    ret
