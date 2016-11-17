[bits 64]

[section .text]

    jmp _loadlibrarya_x64
    
    %include "search_api_x64.asm"

_loadlibrarya_x64:
    push rbp
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    push r14
    push r15
    call _load_start_
	db 'LoadLibraryA',0
_load_start_:
    pop rcx
	call _str2dw_x64
	xor rcx, rcx
	mov rcx, rax
	call _GetFuncAddress_x64
	mov rsi,rax
	jmp data
execute:
    pop rcx
	call rsi
	pop r15
	pop r14
	pop r13
	pop r12
	pop rdi
	pop rsi
	pop rbx
	pop rbp
	ret
data:
    call execute
    times 500 db 0
