; DavydovMA 2013040600 {
;	SOFT_FILE	"libasm_sys_x86_64.asm
;	SOFT_NAME	"libasm_sys_x86_64"
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
; { x64
libasm_sys_write_buf	db	0
; x64 }
section	.bss
section	.text
libasm_sys_write_11:
	push	rdi
	push	rsi
	push	rdx
	push	rcx
	push	rbx
;	push	rax			; .!.
	pushfq
	push	rax
	mov	[libasm_sys_write_buf], al			; work in x64
%ifdef	OS_FREEBSD			; OS_FREEBSD {
	mov	rax, BSD_NR_write
	mov	rbx, BSD_STDOUT
	mov	rcx, rsp
	mov	rdx, 1
	push	rdx			; msg_len
	push	rcx			; msg
	push	rbx			; stdout
	push	rax			; skip
	int	80h
	jc	libasm_sys_exit
	add	rsp, 64
%endif					; } OS_FREEBSD
%ifdef	OS_GNU				; OS_GNU {
	mov	rax, GNU_NR_write
	mov	rbx, GNU_STDOUT		; stdout
;	mov	rcx, rsp		; msg	al --> [RSP]	; not work in x64 { x64
	mov	rcx, libasm_sys_write_buf
; x64 }
	mov	rdx, 1			; msg_len
	int	80h
	cmp	rax, 0fffffffffffff000h
	jae	libasm_sys_exit
%endif					; } OS_GNU
	pop	rax
	popfq
;	pop	rax			; .!.
	pop	rbx
	pop	rcx
	pop	rdx
	pop	rsi
	pop	rdi
	ret
%define	_libasm_sys_exit		; + need
%endif					; } _libasm_sys_write_11
; ------------- ---- ------
; function:	libasm_sys_exit
; rem:		[exit] from soft
; date:		2020-01-18
; in:
;	RAX	: exit CODE
; out:
;
%ifdef		_libasm_sys_exit	; <-key	_libasm_sys_exit {
global	libasm_sys_exit
section	.data
section	.bss
section	.text
libasm_sys_exit:
%ifdef	OS_FREEBSD			; OS_FREEBSD {
	push	rax			; exit CODE
	mov	rax, BSD_NR_exit
	push	rax			; skip
	int	80h
	hlt
%endif					; } OS_FREEBSD
%ifdef	OS_GNU				; OS_GNU {
	mov	rbx, rax		; exit CODE
	mov	rax, GNU_NR_exit
	int	80h
	hlt
%endif					; } OS_GNU
%endif					; } _libasm_sys_exit


; } DavydovMA 2020012000