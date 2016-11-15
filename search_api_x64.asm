[bits 64]

global _str2dw_x64
[section .text]

;x64 function
; RBX, RBP, RDI, RSI, RSP, R12, R13, R14, and R15 are considered nonvolatile and must be saved
_str2dw_x64:
    ;get a value by a string (the name of the function)
    push rbx
    ;
    mov rsi, rcx    ;pointer the funcation's name
    xor ebx, ebx
tag1:
    lodsb
    cmp al,0
    je exit
    movzx edx,al
    mov eax,edx
    mov ecx,ebx
    ror ecx,0x0d
    cmp al,'a'
    jb tag2
    sub eax,32
    add ecx,eax
    jmp tag3
tag2:
    add ecx,eax
tag3:
    mov ebx,ecx
    jmp tag1
exit:
    mov eax,ebx
    pop rbx
    ret 
    
    
