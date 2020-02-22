extern printf
global main

section .data
    str: db "Clock ticks: %d", 10, 13
    length dd 0
section .text
main:
    push ebp
    mov ebp, esp

    mov ecx, 1000
    xor eax, eax
    rdtsc
    xor edi, edi
    mov edi, eax
    
Loop1:
    loop Loop1
    
    mov esi, eax
    rdtsc
    sub eax, edi
    
    push eax
    push str
    call printf
    add esp, 8
    mov ecx, 1000
    rdtsc
    mov esi, eax
Loop2:
    dec ecx
    cmp ecx, 0
    jnz Loop2    
    
    rdtsc
    sub eax, esi
    
    push eax
    push str
    call printf
    add esp, 8

    mov esp, ebp
    pop ebp
    ret
