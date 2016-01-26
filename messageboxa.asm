[bits 32]

global _msg_start
global _GetFuncAddress
global _str2dw
[section .text]



_msg_start:
	pushad
	push 0x9aca9698
	call _GetFuncAddress
	add esp,4h
	call title
	db 'title',0
title:
	pop ebx
	push dword 0x00000000
	push ebx
	push ebx
	push dword 0x00000000
	call eax
	popad
	ret
	%include "shellcode_framework.asm"