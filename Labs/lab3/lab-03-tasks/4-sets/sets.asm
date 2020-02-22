%include "io.inc"

section .data
    a DW 12
section .text
global CMAIN

CMAIN:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139 
    mov ebx, 169
    
    PRINT_DEC 4, eax ; afiseaza prima multime
    NEWLINE
    PRINT_DEC 4, ebx ; afiseaza cea de-a doua multime
    NEWLINE
    mov ecx, eax
    ; TODO1: reuniunea a doua multimi
    or eax, ebx
    PRINT_DEC 4, eax
    NEWLINE
   
    ; TODO2: adaugarea unui element in multime
    mov eax, ecx
    or eax, 20
    PRINT_DEC 4, eax
    NEWLINE
    
    ; TODO3: intersectia a doua multimi
    mov eax, 139 
    mov ebx, 169
    and eax, ebx
    PRINT_DEC 4, eax
    NEWLINE
    
    ; TODO4: complementul unei multimi
    mov eax, 139
    not eax;
    PRINT_DEC 4, al
    NEWLINE
    
    ; TODO5: eliminarea unui element
    ; not eax; ???????????
    mov eax, 139;
    mov ecx, 11
    and eax, ecx
    
    mov eax, 139
    and eax, 127
    PRINT_DEC 4, eax
    NEWLINE
    
    PRINT_DEC 4, eax
    NEWLINE
    
    ; TODO6: diferenta de multimi EAX-EBX
    ; ??????????????
    mov eax, 139
    and eax, ebx
    xor eax, 139
    PRINT_DEC 4, eax
    NEWLINE
    
    xor eax, ebx
    
    PRINT_DEC 4, eax
    NEWLINE
    PRINT_DEC 4, ebx
    NEWLINE
    xor eax, eax
    ret
