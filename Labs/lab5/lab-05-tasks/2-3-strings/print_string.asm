%include "io.inc"

section .data
    text db "Hello, World!", 10, 0
section .text
global CMAIN

print_string:
    push ebp
    mov ebp, esp
    
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, 14
    syscall 
    
    leave
    ret
CMAIN:
    push ebp
    mov ebp, esp
    
    push text
    call print_string
    add esp, 4
    
    leave
    ret