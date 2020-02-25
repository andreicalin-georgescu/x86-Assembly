%include "io.inc"

%define MAX_INPUT_SIZE 4 ;definim buffer de citire la un singur caracter char

section .bss
	expr: resb MAX_INPUT_SIZE

section .data
    string db "Ana are mere", 0 ;stringul in care cautam
    found db "Found!", 0
    not_found db "Not found!", 0
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp
    ;write your code here
    xor eax, eax
    
    GET_STRING expr, MAX_INPUT_SIZE
    
    cld             
    mov al, 0x00      
    mov edi, string  
    repne scasb    
 
    ; edi acum pointează la următorul caracter după primul caracter '0x00'
    sub edi, string  
    dec edi
    ;in edi avem lungimea sirului
    
    mov ebx, edi
    
    cld              ; setăm DF = 0
    mov al, [expr]      ; char-ul pe care vrem să îl căutăm
    mov edi, string  ; zona de memorie în care căutăm
    repne scasb      ; parcurgem cu edi șirul până cănd caracterul la care pointează șirul este diferit de al 

    sub edi, string
    dec edi
    
    cmp edi, ebx
    ja _not_found

_found:      
    push found
    call puts
    add esp, 4
    jmp _end
        
_not_found:
    push not_found
    call puts
    add esp, 4
_end:        
    xor eax, eax
    leave
    ret