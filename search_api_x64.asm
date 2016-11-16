[bits 64]

global _str2dw_x64
global _GetFuncAddress_x64
[section .text]

;x64 function
; RBX, RBP, RDI, RSI, RSP, R12, R13, R14, and R15 are considered nonvolatile and must be saved
_str2dw_x64:
    ;get a value by a string (the name of the function)
    push    rbx
    push    rsi
    push    rdi
    ;
    mov     rsi, rcx    ;pointer the funcation's name
    xor     ebx, ebx
tag1:
    lodsb
    cmp     al, 0
    je      exit
    movzx   edx, al
    mov     eax, edx
    mov     ecx, ebx
    ror     ecx, 0x0d
    cmp     al,'a'
    jb      tag2
    sub     eax, 32
    add     ecx, eax
    jmp     tag3
tag2:
    add     ecx, eax
tag3:
    mov     ebx, ecx
    jmp     tag1
exit:
    mov     eax, ebx
    pop     rdi
    pop     rsi
    pop     rbx
    ret 
    
    
;search api 
_GetFuncAddress_x64:
    push    rbx
    push    rbp
    push    rsi
    push    rdi 
    push    rbp
    
    
    mov     rbp, rsp
    sub     rsp, 30h
    
    mov     qword [rbp-28h], rcx
    
    mov     rbx, qword [gs:60h]
    mov     rdi, qword [rbx+18h]     ; _PEB->Ldr
    mov     rsi, qword [rdi+20h]     ; (_LDR_DATA_TABLE_ENTRY)Ldr->InMemoryOrderModuleList
    
    lodsq
    mov     qword [rbp-8h], rax     ;save the first LDR_DATA_TABLE_ENTRY
    mov     rdi, qword [rbp-8h]
    ;edi as a pointer of the IDR_DATA_TABLE_ENTRY 
s1:	
    xor     rax, rax
    mov	    rbx, qword [rdi + 20h]  ; DllBase InMemeoryOrderLinks with DllBase offset
    cmp     rbx, 0
    jz      _exit
    xor     rdx, rdx
    mov     edx, dword [rbx + 3ch]    ;_IMAGE_DOS_HEADER->e_lfnew    
    add     rdx, rbx
    add     rdx, 18h                ;_IMAGE_NT_HEADER64->OptionalHeader
    add     rdx, 70h                ;_IMAGE_OPTIONAL_HEADER64->IMAGE_DATA_DIRECTORY
    cmp     dword [rdx], 0
    je      s2
    
    xor     rax, rax
    mov     eax, dword [rdx]         
    mov     rdx, rax
    add     rdx, rbx                 ;get the address of _IMAGE_EXPORT_DIRECTORY
    mov     qword [rbp-14h], rdx     ;save the IMAGE_EXPORT_DIRECOTRY's address
    xor     rcx, rcx
    mov     ecx, dword [rdx+18h]	    ;save IMAGE_EXPORT_DIRECTORY->NumberofNames
    dec     ecx
    xor     rax, rax
    mov     eax, dword [rdx+20h]
    mov     rdx, rax
    add     rdx, rbx	                ;get the array of functions'name
s3:
    ;push dword [rdx +rcx*4]
    ;pop dword [rbp-10h]
    ;add dword [rbp-10h],rbx     ;the name of the first function
    push    rdx
    push    rcx
    mov     ecx, dword [rdx +rcx*4]
    and     rcx, 0x00000000ffffffff
    add     rcx, rbx
    call    _str2dw_x64
    cmp     eax,dword [rbp-28h]      ;compare with the param
    pop     rcx
    pop     rdx
    jne     s4
    ;---------------------------------------
    mov     rax, qword [rbp-14h]     ;get the address of IMAGE_EXPORT_DIRECTORY
    mov     eax, dword [rax+24h]
    and     rax, 0x00000000ffffffff
    add     rax, rbx
    mov     ax,  word [rax+rcx*2]
    and     rax, 0x000000000000ffff
    mov     qword [rbp-20h], rax     ;save the index of AddressofNameOrdinals
    mov     rax, qword [rbp-14h]
    push    rsi
    mov     rsi, qword [rbp-20h]
    mov     eax, dword [rax+1ch]
    and     rax, 0x00000000ffffffff
    add     rax, rbx
    mov     eax, dword [rax+rsi*4]
    and     rax, 0x00000000ffffffff
    add     rax, rbx
    pop     rsi
    jmp     _exit
s4:
    loop    s3
s2:	
    mov     rsi, qword [rdi]        ;??????
    mov     rax, qword [rdi+8h]
    mov     rdi, rsi
    cmp     rsi, qword [rbp-8h]  ; 
    jne     s1
    xor     rax, rax	
_exit:

    mov     rsp, rbp
    
    pop     rbp
    pop     rdi
    pop     rsi
    pop     rbp
    pop     rbx
    ret ;keep silent of esp