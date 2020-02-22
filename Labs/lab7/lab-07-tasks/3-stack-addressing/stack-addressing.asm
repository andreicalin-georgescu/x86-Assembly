%include "io.inc"

%define NUM 5

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    ;sub esp, 36
    ; TODO 1: replace every push by an equivalent sequence of commands
    mov ecx, NUM

push_nums:
    
    sub esp, 4
    mov [esp], ecx
    loop push_nums

 
    sub esp, 4
    mov [esp], dword  0
    sub esp, 4
    mov [esp], dword "mere"
    sub esp, 4
    mov [esp], dword "are " ;dword = 4 char
    sub esp, 4
    mov [esp], dword "Ana "
    

    PRINT_STRING [esp]
    NEWLINE

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    mov eax, esp
start:
    PRINT_HEX 4, eax
    PRINT_STRING ": "
    PRINT_HEX 4, [eax]
    NEWLINE
    add eax, 4
    cmp eax, ebp
    jne start

; de ce nu e bine asa
;print_stack:
;    PRINT_HEX 4, esp
;    NEWLINE
;    PRINT_HEX 4, [esp]
;    NEWLINE
;    add esp, 4
;    cmp esp, ebp
;    jg print_stack
    ; TODO 3: print the string
    PRINT_STRING [esp]
    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
