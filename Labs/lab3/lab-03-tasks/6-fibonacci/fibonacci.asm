%include "io.inc"

section .data
    count: DW 1, 0
    a: DW 0, 0
    b: DW 1, 0
    sum: DW 0, 0
section .text
global CMAIN
CMAIN:
    mov eax, 9      ; vrem sa aflam al N-lea numar; N = 7
    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
    cmp eax, 0
    je print0
    cmp eax, 1
    je print0

    mov DWORD [count], 4
    PRINT_DEC 4, [count]
    cmp eax, 1
    mov ebx, 0
    mov ecx, 1
    jg loop1
    
loop1: 
    ;???????????????
    ;add sum, a
    ;add sum, b
    ;add count, 1
    ;mov b, a
    ;mov b, sum
    ;mov ebx, count
    ;cmp ebx, eax
    ;jl loop1
    
    add ebx, ecx
    xchg ebx, ecx
    sub eax, 1
    cmp eax, 0
    jg loop1
    jp printn
print0:
    PRINT_DEC 4, eax
    ret
printn:
    PRINT_DEC 4, ebx
    ret