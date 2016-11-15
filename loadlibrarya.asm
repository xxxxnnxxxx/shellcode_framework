[bits 32]

[section .text]

jmp _loadlibrarya_

%include "search_api.asm"

_loadlibrarya_:
	pushad
	call 	_load_start_
	db 'LoadLibraryA',0
_load_start_:
	call 	_str2dw
	add 	esp,4h
	push 	eax
	call 	_GetFuncAddress
	add 	esp,4h
	mov 	esi,eax
	jmp 	data
execute:
    pop 	eax
    push 	eax
	call 	esi
	popad
	ret 4
data:
    call execute
    times 500 db 0
	