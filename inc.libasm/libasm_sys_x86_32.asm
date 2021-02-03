; DavydovMA 2013040600 {
;	SOFT_FILE	"libasm_sys_x86_32.asm
;	SOFT_NAME	"libasm_sys_x86_32"
;	SOFT_VERSION	"1.0.0"
;	SOFT_COPYRIGHT	"Copyright 1990-2018"
;	SOFT_AUTHOR	"DavydovMA"
;	SOFT_URL	"http://domain"
;	SOFT_EMAIL	"dev@domain"


; ------------- ---- ------
; rem:		all function ON
;
%ifdef		_libasm_sys_all		; <-key
%define		_libasm_sys_exit	; function:	libasm_sys_exit		; 0. [exit]
%define		_libasm_sys_write_11	; function:	libasm_sys_write_11	; 4. [write] stdout [1] 1 [1] char
%endif
; ------------- ---- ------
; function:	libasm_sys_write_11
; rem:		[write] to STDOUT [1] 1 [1] char
; in:
;	AL	: char
; out:
;
%ifdef		_libasm_sys_write_11	; <-key	_libasm_sys_write_11
global	libasm_sys_write_11
section	.data
section	.bss
section	.text
libasm_sys_write_11:
	push	edi
	push	esi
	push	edx
	push	ecx
	push	ebx
;	push	eax			; .!.
	pushfd
	push	eax
%ifdef	OS_FREEBSD			; OS_FREEBSD {
	mov	eax, BSD_NR_write
	mov	ebx, BSD_SDTOUT
	mov	ecx, esp
	mov	edx, 1
	push	edx			; msg_len
	push	ecx			; msg
	push	ebx			; stdout
	push	eax			; skip
	int	80h
	jc	libasm_sys_exit
	add	esp, 16
%endif					; } OS_FREEBSD
%ifdef	OS_GNU				; OS_GNU {
	mov	eax, GNU_NR_write
	mov	ebx, GNU_STDOUT		; stdout
	mov	ecx, esp		; msg	al --> [ESP]
	mov	edx, 1			; msg_len
	int	80h
	cmp	eax, 0fffff000h
	jae	libasm_sys_exit
%endif					; } OS_GNU
	pop	eax
	popfd
;	pop	eax			; .!.
	pop	ebx
	pop	ecx
	pop	edx
	pop	esi
	pop	edi
	ret
%define	_libasm_sys_exit		; + need
%endif					; } _libasm_sys_write_11
; ------------- ---- ------
; function:	libasm_sys_exit
; rem:		[exit] from soft
; date:		2020-01-18
; in:
;	EAX	: exit CODE
; out:
;
%ifdef		_libasm_sys_exit	; <-key	_libasm_sys_exit {
global	libasm_sys_exit
section	.data
section	.bss
section	.text
libasm_sys_exit:
%ifdef	OS_FREEBSD			; OS_FREEBSD {
	push	eax			; exit CODE
	mov	eax, BSD_NR_exit
	push	eax			; skip
	int	80h
	hlt
%endif					; } OS_FREEBSD
%ifdef	OS_GNU				; OS_GNU {
	mov	ebx, eax		; exit CODE
	mov	eax, GNU_NR_exit
	int	80h
	hlt
%endif					; } OS_GNU
%endif					; } _libasm_sys_exit


; } DavydovMA 20120012000