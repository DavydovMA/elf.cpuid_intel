; DavydovMA 2013040600 {
;	SOFT_FILE	"libasm_prn_x86_64.asm
;	SOFT_NAME	"libasm_prn_x86_64"
;	SOFT_VERSION	"1.1.2"
;	SOFT_COPYRIGHT	"Copyright 1990-2018"
;	SOFT_AUTHOR	"DavydovMA"
;	SOFT_URL	"http://domain"
;	SOFT_EMAIL	"dev@domain"


; ------------- ---- -----
; rem:		all function ON
;
%ifdef		_libasm_prn_all		; <-key
%define		_libasm_prn_ascii	; function:	libasm_prn_ascii
%define		_libasm_prn_ascii_msg	; function:	libasm_prn_ascii_msg
%define		_libasm_prn_int
%endif
; ------------- ---- ------
; function:	libasm_prn_ascii
; rem:		print to STDOUT ascii byte
; in:
;	AL	: ascii symbol
; out:
;
%ifdef		_libasm_prn_ascii	; <-key	_libasm_prn_ascii {
global	libasm_prn_ascii
section	.data
section	.bss
section	.text
libasm_prn_ascii:
	push	rdi
	push	rsi
	push	rdx
	push	rcx
	push	rbx
;	push	rax			; .!.
	pushfq
	call	libasm_prn_int
	popfq
;	pop	rax			; .!.
	pop	rbx
	pop	rcx
	pop	rdx
	pop	rsi
	pop	rdi
	ret
%define		_libasm_prn_int		; + need
%endif					; } libasm_prn_ascii
; ------------- ---- ------
; function:	libasm_prn_ascii_msg
; rem:		print to STDOUT ascii text of byte with 00h end
; in:
;	RAX	: ADDR of text
; out:
;
%ifdef		_libasm_prn_ascii_msg	; <-key	libasm_prn_ascii_msg {
global	libasm_prn_ascii_msg
section	.data
section	.bss
section	.text
libasm_prn_ascii_msg:
	push	rdi
	push	rsi
	push	rdx
	push	rcx
	push	rbx
	push	rax
	pushfq
	cld
	mov	rsi, rax
.libasm_prn_00:
	lodsb
	call	libasm_prn_int
	jnz	.libasm_prn_00
	popfq
	pop	rax
	pop	rbx
	pop	rcx
	pop	rdx
	pop	rsi
	pop	rdi
	ret
%define		_libasm_prn_int		; + need
%endif					; } _libasm_prn_ascii_msg
; ------------- ---- ------
; function:	libasm_prn_int
; rem:		print to STDOUT ascii byte
; in:
;	AL	: ascii symbol
; out:
;
%ifdef		_libasm_prn_int		; <-key	_libasm_prn_int {
section	.data
section	.bss
section	.text
libasm_prn_int:
	test	al,al
	jz	.libasm_prn_99
	push	rax
	call	libasm_sys_write_11
	pop	rax
.libasm_prn_99:
	ret
%define		_libasm_sys_write_11	; + need
%endif					; } _libasm_prn_int


; } DavydovMA 2018061300
