%include "io.inc"
extern printf

section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "abcd2eGH hij", 0

section .text
global CMAIN

toupper:
    push ebp
    mov ebp, esp

    ; TODO
    mov eax, mystring
    xor ebx, ebx
    xor ecx, ecx
    loop1:
        mov bl, byte [eax + ecx]
        test bl, bl
        je out
        cmp bl, 0x7A
        jg skip1
        cmp bl, 0x61
        jl skip1
        sub bl, 0x20
        mov byte [eax + ecx], bl
        inc ecx
        ;inc eax
        jmp loop1
        skip1:
            inc ecx
            jmp loop1
        
    leave
    ret

CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4
out:
    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
