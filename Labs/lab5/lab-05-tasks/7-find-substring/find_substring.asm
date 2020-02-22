%include "io.inc"

section .data
;                12345678901234567890123456789012345
;source_text: db "ABABCCBABCBABCBBBABCBBCBABCBAAACCCBB", 0
source_text: db "85 -73 54 * -73 * -124 / 87 * - 55 + 65 -128 * -", 0
substring: db " ", 0
negativ db "-", 0
 var db "-", 0
 aux dd 0
 plus db "+", 0
 inmultire db "*", 0
 impartire db "/", 0
ant: dw 0
len: dw 0
cuv: db "           ", 0
null: db "", 0
keep_eax: dd 0
keep_esi: dd 0

skip_len: dd 0

source: dd 0
dest: dd 0

source_length: resd 1
substr_length: dd 4
a: dw 0
b: dd 0
print_format: db "Substring found at index: ", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp
    
    ; TODO: Fill source_length with the length of the source_text string.
    cld
    mov al, 0
    mov edi, source_text
    repne scasb
    
    sub edi, source_text
    dec edi
    mov [source_length], edi
    mov ecx, [source_length]
    PRINT_DEC 4, ecx
    ; Find the length of the string using scasb.
    cld
    mov al, 0
    mov edi, substring
    repne scasb
    
    sub edi, substring
    dec edi
    mov edi, 1
    mov [substr_length], edi
    ;mov [substr_length], 1
    PRINT_DEC 4, substr_length
    NEWLINE
    ; TODO: Print the start indices for all occurrences of the substring in source_text
    mov ecx, [source_length]
    mov edi, source_text
    
loop1:
    mov al, ' '
    repne scasb
    cmp ecx, 0
    jl out1
    je out1
    mov esi, substring
    dec edi
    mov dword [a], ecx
    mov ecx, [substr_length]
    repe cmpsb
    ;cmp ecx, 0
    jz print
    cmp ecx, 0
    jnz skip
    print:
        mov eax, edi
        sub dword eax, source_text
        sub dword eax, [substr_length]
        cmp eax, [source_length]
        jg out1
        inc eax
        
        mov dword [source], esi
        mov dword [dest], edi
        mov edx, ecx

        ;PRINT_STRING print_format
        ;PRINT_DEC 4, eax
        ;NEWLINE
        ;PRINT_DEC 4, [ant]
        ;NEWLINE
        
        mov esi, source_text
        add esi, dword [ant]
       ; PRINT_STRING [esi]
        ;NEWLINE
        
        mov ecx, eax
        sub ecx, dword [ant]
        mov edi, cuv
        dec ecx
        
        cmp ecx, 1
        jg testare
        ;daca e +-*/ sau un nr
        je test_if_num
       
        ;mov dword [keep_esi], esi
        skip1:
        ;mov esi, dword [keep_esi]
        jmp convert_dec
        
        skip2:
            dec esi
            ;PRINT_STRING "ESI: "
            ;PRINT_STRING [esi]
            ;NEWLINE
            jmp convert_dec
        continuare:
       ; PRINT_STRING cuv
       ; NEWLINE
        
        ;refacere sursa si dest
        mov esi, dword [source]
        mov edi, dword [dest]
        mov ecx, edx
        
        mov dword [ant], eax
        mov eax, dword [ant]
        
        mov esi, substring
        cmp eax, 0
        je sfarsit
    skip:
        mov ecx, dword [a]
        mov esi, substring
        cmp ecx, 0
        jg loop1
    convert_dec:
        cld
        mov dword [keep_eax], eax
        
        xor edx, edx
        xor eax, eax
        counter:
            imul edx, 10
            lodsb
            sub al, 48
            add edx, eax
            loop counter
                  
        mov eax, dword [keep_eax]
        
        push edx
        PRINT_STRING "Adaug nr poz: "
        PRINT_DEC 4, edx
        NEWLINE
        jmp continuare
        
        convert_dec_neg:
            cld
            mov dword [keep_eax], eax
            ;PRINT_STRING "ESI : "
            ;PRINT_STRING [esi]
            dec ecx
            xor edx, edx
            xor eax, eax
            counter11:
                imul edx, 10
                lodsb
                sub al, 48
                add edx, eax
                loop counter11
                      
            mov eax, dword [keep_eax]
            
            not edx
            add edx, 1
            ;adaug pe stiva nr negativ salvat in edx
            push edx
            PRINT_STRING "Adaug nr nega"
            PRINT_DEC 4,  edx
            NEWLINE
            jmp continuare
        testare:
            mov dword [keep_esi], esi
            mov esi, dword [keep_esi]
            mov edi, var
            cmpsb
            je printare
            jne skip2
            printare:
                ; nr negativ
                ;PRINT_STRING "e neeeeeeeeeeef"
                jmp convert_dec_neg
                ;jmp skip1
        ;jmp skip1
        scade:
            mov dword [keep_eax], eax
            cmp esp, ebp
            je sfarsit
            pop eax
            mov dword [aux], eax
            cmp esp, ebp
            je sfarsit
            pop eax
            sub eax, dword [aux]
            push eax
            mov eax, dword [keep_eax]
            jmp continuare
        
        aduna:
            mov dword [keep_eax], eax
            cmp esp, ebp
            je sfarsit
            pop eax
            mov dword [aux], eax
            cmp esp, ebp
            je sfarsit
            pop eax
            add eax, dword [aux]
            push eax
            mov eax, dword [keep_eax]
            jmp continuare
            
        inmulteste:
            mov dword [keep_eax], eax
            cmp esp, ebp
            je sfarsit
            pop eax
            mov dword [aux], eax
            cmp esp, ebp
            je sfarsit
            pop eax
            imul dword [aux];???????
            push eax;??????
            mov eax, dword [keep_eax]
            jmp continuare
            
          imparte:
            mov dword [keep_eax], eax
            cmp esp, ebp
            je sfarsit
            
            pop eax
            mov dword [aux], eax
            cmp esp, ebp
            je sfarsit
            pop eax
            xor edx, edx
            idiv dword [aux]
            push eax
            
            mov eax, dword [keep_eax]
            jmp continuare
            
            
        test_if_num:
            mov dword [keep_esi], esi
            mov edi, var
            cmpsb
            je scade
            
            
            mov esi, dword [keep_esi]
            mov edi, plus
            cmpsb
            je aduna
            
            mov esi, dword [keep_esi]
            mov edi, inmultire
            cmpsb
            je inmulteste
            
            mov esi, dword [keep_esi]
            mov edi, impartire
            cmpsb
            je imparte
            
            mov esi, dword [keep_esi]
            jmp testare
            
  out1:
      mov esi, source_text
      add esi, [ant]
      xor edx, edx
      xor eax, eax
      PRINT_STRING "Aici esi: "
      PRINT_STRING [esi]
      NEWLINE
      mov ecx, dword [source_length]
      sub ecx, dword [ant]
      cmp ecx, 1
      jg testare
        ;daca e +-*/ sau un nr
      je test_if_num
     ;       counter1:
      ;          imul edx, 10
       ;         lodsb
        ;        sub al, 48
         ;       add edx, eax
          ;      loop counter1
                
  sfarsit:
    pop eax
    PRINT_DEC 4, eax
    leave
    ret