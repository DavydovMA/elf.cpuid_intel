; DavydovMA 2013040600 {
;	SOFT_FILE	"libasm_hex_x86_32.asm
;	SOFT_NAME	"libasm_hex_x86_32"
;	SOFT_VERSION	"1.1.1"
;	SOFT_COPYRIGHT	"Copyright 1990-2018"
;	SOFT_AUTHOR	"DavydovMA"
;	SOFT_URL	"http://domain"
;	SOFT_EMAIL	"dev@domain"


; ------------- ---- ------
; rem:		all function ON
%ifdef		_libasm_hex_all		; <-key
%define		_libasm_hex_04b		; function:	libasm_hex_04b
%define		_libasm_hex_08b		; function:	libasm_hex_08b
%define		_libasm_hex_12b		; function:	libasm_hex_12b
%define		_libasm_hex_16b		; function:	libasm_hex_16b
%define		_libasm_hex_20b		; function:	libasm_hex_20b
%define		_libasm_hex_24b		; function:	libasm_hex_24b
%define		_libasm_hex_28b		; function:	libasm_hex_28b
%define		_libasm_hex_32b		; function:	libasm_hex_32b
%define		_libasm_hex_32bs	; function:	libasm_hex_32bs
%define		_libasm_hex_08m		; function:	libasm_hex_08m
%define		_libasm_hex_16m		; function:	libasm_hex_16m
%define		_libasm_hex_32m		; function:	libasm_hex_32m
%define		_libasm_hex_64m		; function:	libasm_hex_64m
%define		_libasm_hex_80m		; function:	libasm_hex_80m
%define		_libasm_hex_128m	; function:	libasm_hex_128m
%define		_libasm_hex_256m	; function:	libasm_hex_256m
%define		_libasm_hex_512m	; function:	libasm_hex_512m
%define		_libasm_hex_128l	; function:	libasm_hex_128l
%endif
; ------------- ---- ------
; function:	libasm_hex_128l
; rem:		print 16 byte (128-bit) from ADDR
; in:
;	EAX	: ADDR
; out:
;
%ifdef		_libasm_hex_128l	; <-key	_libasm_hex_128l {
global	libasm_hex_128l
section	.data
section	.bss
section	.text
libasm_hex_128l:
	push	ebx
	push	eax
	pushfd
	mov	bx, 1020h
.libasm_hex_00:
	call	libasm_hex_08m
	inc	eax
	xchg	eax, ebx
	call	libasm_prn_ascii
	xchg	eax, ebx
	dec	bh
	jnz	.libasm_hex_00
	popfd
	pop	eax
	pop	ebx
	ret
%define		_libasm_hex_08m		; + need
%define		_libasm_prn_ascii	; + need
%endif					; } _libasm_hex_128l
; ------------- ---- ------
; function:	libasm_hex_512m
; rem:		print 512 bit from ADDR
; in:
;	EAX	: ADDR
; out:
;
%ifdef		_libasm_hex_512m	; <-key	_libasm_hex_512m {
global	libasm_hex_512m
section	.data
section	.bss
section	.text
libasm_hex_512m:
	push	ecx
	mov	ecx, 40h
	jmp	libasm_hex_88m
%define		_libasm_hex_16m		; + need
%endif					; } _libasm_hex_512m
; ------------- ---- ------
; function:	libasm_hex_256m
; rem:		print 256 bit from ADDR
; in:
;	EAX	: ADDR
; out:
;
%ifdef		_libasm_hex_256m	; <-key	_libasm_hex_256m {
global	libasm_hex_256m
section	.data
section	.bss
section	.text
libasm_hex_256m:
	push	ecx
	mov	ecx, 20h
	jmp	libasm_hex_88m
%define		_libasm_hex_16m		; + need
%endif					; } _libasm_hex_256m
; ------------- ---- ------
; function:	libasm_hex_128m
; rem:		print 128 bit from ADDR
; in:
;	EAX	: ADDR
; out:
;
%ifdef		_libasm_hex_128m	; <-key	_libasm_hex_128m {
global	libasm_hex_128m
section	.data
section	.bss
section	.text
libasm_hex_128m:
	push	ecx
	mov	ecx, 10h
	jmp	libasm_hex_88m
%define		_libasm_hex_16m		; + need
%endif					; } _libasm_hex_128m
; ------------- ---- ------
; function:	libasm_hex_80m
; rem:		print 80 bit from ADDR
; in:
;	EAX	: ADDR
; out:
;
%ifdef		_libasm_hex_80m		; <-key	_libasm_hex_80m {
global	libasm_hex_80m
section	.data
section	.bss
section	.text
libasm_hex_80m:
	push	ecx
	mov	ecx, 0ah
	jmp	libasm_hex_88m
%define		_libasm_hex_16m		; + need
%endif					; } _libasm_hex_80m
; ------------- ---- ------
; function:	libasm_hex_64m
; rem:		print 64 bit from ADDR
; in:
;	EAX	: ADDR
; out:
;
%ifdef		_libasm_hex_64m		; <-key	_libasm_hex_64m {
global	libasm_hex_64m
section	.data
section	.bss
section	.text
libasm_hex_64m:
	push	ecx
	mov	ecx, 08h
	jmp	libasm_hex_88m
%define		_libasm_hex_16m		; + need
%endif					; } _libasm_hex_64m
; ------------- ---- ------
; function:	libasm_hex_32m
; rem:		print 32 bit from ADDR
; in:
;	EAX	: ADDR
; out:
;
%ifdef		_libasm_hex_32m		; <-key	_libasm_hex_32m {
global	libasm_hex_32m
section	.data
section	.bss
section	.text
libasm_hex_32m:
	push	ecx
	mov	ecx, 04h
	jmp	libasm_hex_88m
%define		_libasm_hex_16m		; + need
%endif					; } _libasm_hex_32m
; ------------- ---- ------
; function:	libasm_hex_16m
; rem:		print 16 bit from ADDR
; in:
;	EAX	: ADDR
; out:
;
%ifdef		_libasm_hex_16m		; <-key	_libasm_hex_16m {
global	libasm_hex_16m
section	.data
section	.bss
section	.text
libasm_hex_16m:
	push	ecx
	mov	ecx, 02h
libasm_hex_88m:
	push	eax
	pushfd
	add	eax, ecx
.libasm_hex_00:
	dec	eax
	call	libasm_hex_08m
	loop	.libasm_hex_00
	popfd
	pop	eax
	pop	ecx
	ret
%define		_libasm_hex_08m		; + need
%endif					; } _libasm_hex_16m
; ------------- ---- ------
; function:	libasm_hex_08m
; rem:		print 08 bit from ADDR
; in:
;	EAX	: ADDR
; out:
;
%ifdef		_libasm_hex_08m		; <-key	_libasm_hex_08m {
global	libasm_hex_08m
section	.data
section	.bss
section	.text
libasm_hex_08m:
	push	eax
	pushfd
	mov	ah, [eax]
	mov	al, ah
	ror	al, 4
	call	libasm_hex_04b
	mov	al, ah
	call	libasm_hex_04b
	popfd
	pop	eax
	ret
%define		_libasm_hex_04b		; + need
%endif					; } _libasm_hex_08m
; ------------- ---- ------
; function:	libasm_hex_32bs
; rem:		print 32 bit with ':' seperate
; in:
;	EAX	: 00000000 - FFFFFFFF
; out:
;
%ifdef		_libasm_hex_32bs	; <-key	_libasm_hex_32bs {
global	libasm_hex_32bs
section	.data
section	.bss
section	.text
libasm_hex_32bs:
	push	ebx
	push	eax
	pushfd
	mov	ebx, eax
	ror	eax, 16
	call	libasm_hex_16b
	mov	al, ':'
	call	libasm_prn_ascii
	mov	eax, ebx
	call	libasm_hex_16b
	popfd
	pop	eax
	pop	ebx
	ret
%define		_libasm_hex_16b		; + need
%define		_libasm_prn_ascii	; + need
%endif					; } _libasm_hex_32bs
; ------------- ---- ------
; function:	libasm_hex_32b
; rem:		print 32 bit
; in:
;	EAX	: 00000000 - FFFFFFFF
; out:
;
%ifdef		_libasm_hex_32b		; <-key	_libasm_hex_32b {
global	libasm_hex_32b
section	.data
section	.bss
section	.text
libasm_hex_32b:
	push	eax
	pushfd
	ror	eax, 16
	call	libasm_hex_16b
	rol	eax, 16
	call	libasm_hex_16b
	popfd
	pop	eax
	ret
%define		_libasm_hex_16b		; + need
%endif					; } _libasm_hex_32b
; ------------- ---- ------
; function:	libasm_hex_28b
; rem:		print 28 bit
; in:
;	EAX	: .0000000 - .FFFFFFF
; out:
;
%ifdef		_libasm_hex_28b		; <-key	_libasm_hex_28b {
global	libasm_hex_28b
section	.data
section	.bss
section	.text
libasm_hex_28b:
	push	eax
	pushfd
	ror	eax, 16
	call	libasm_hex_12b
	rol	eax, 16
	call	libasm_hex_16b
	popfd
	pop	eax
	ret
%define		_libasm_hex_12b		; + need
%define		_libasm_hex_16b		; + need
%endif					; } _libasm_hex_28b
; ------------- ---- ------
; function:	libasm_hex_24b
; rem:		print 24 bit
; in:
;	EAX	: ..000000 - ..FFFFFF
; out:
;
%ifdef		_libasm_hex_24b		; <-key	_libasm_hex_24b {
global	libasm_hex_24b
section	.data
section	.bss
section	.text
libasm_hex_24b:
	push	eax
	pushfd
	ror	eax, 16
	call	libasm_hex_08b
	rol	eax, 16
	call	libasm_hex_16b
	popfd
	pop	eax
	ret
%define		_libasm_hex_08b		; + need
%define		_libasm_hex_16b		; + need
%endif					; } _libasm_hex_24b
; ------------- ---- ------
; function:	libasm_hex_20b
; rem:		print 20 bit
; in:
;	EAX	: ...00000 - ...FFFFF
; out:
;
%ifdef		_libasm_hex_20b		; <-key	_libasm_hex_20b {
global	libasm_hex_20b
section	.data
section	.bss
section	.text
libasm_hex_20b:
	push	eax
	pushfd
	ror	eax, 16
	call	libasm_hex_04b
	rol	eax, 16
	call	libasm_hex_16b
	popfd
	pop	eax
	ret
%define		_libasm_hex_04b		; + need
%define		_libasm_hex_16b		; + need
%endif					; } _libasm_hex_20b
; ------------- ---- ------
; function:	libasm_hex_16b
; rem:		print 16 bit
; in:
;	AX	: 0000 - FFFF
; out:
;
%ifdef		_libasm_hex_16b		; <-key	_libasm_hex_16b {
global	libasm_hex_16b
section	.data
section	.bss
section	.text
libasm_hex_16b:
	push	eax
	pushfd
	ror	ax, 8
	call	libasm_hex_08b
	rol	ax, 8
	call	libasm_hex_08b
	popfd
	pop	eax
	ret
%define		_libasm_hex_08b		; + need
%endif					; } _libasm_hex_16b
; ------------- ---- ------
; function:	libasm_hex_12b
; rem:		print 12 bit
; in:
;	AX	: .000 - .FFF
; out:
;
%ifdef		_libasm_hex_12b		; <-key	_libasm_hex_12b {
global	libasm_hex_12b
section	.data
section	.bss
section	.text
libasm_hex_12b:
	push	eax
	pushfd
	ror	ax, 8
	call	libasm_hex_04b
	rol	ax, 8
	call	libasm_hex_08b
	popfd
	pop	eax
	ret
%define		_libasm_hex_04b		; + need
%define		_libasm_hex_08b		; + need
%endif					; } _libasm_hex_12b
; ------------- ---- ------
; function:	libasm_hex_08b
; rem:		print 08 bit
; in:
;	AL	: 00 - FF
; out:
;
%ifdef		_libasm_hex_08b		; <-key	_libasm_hex_08b {
global	libasm_hex_08b
section	.data
section	.bss
section	.text
libasm_hex_08b:
	push	eax
	pushfd
	mov	ah, al
	ror	al, 4
	call	libasm_hex_04b
	mov	al, ah
	call	libasm_hex_04b
	popfd
	pop	eax
	ret
%define		_libasm_hex_04b		; + need
%endif					; } _libasm_hex_08b
; ------------- ---- ------
; function:	libasm_hex_04b
; rem:		print low 04 bit of byte
; in:
;	AL	:  0 - F
; out:
;
%ifdef		_libasm_hex_04b		; <-key	_libasm_hex_04b {
global	libasm_hex_04b
section	.data
section	.bss
section	.text
libasm_hex_04b:
	push	eax
	pushfd
	and	al, 0fh
	cmp	al, 09h
	jng	.libasm_hex_00
	add	al, 07h
.libasm_hex_00:
	add	al, 30h
	call	libasm_prn_ascii
	popfd
	pop	eax
	ret
%define		_libasm_prn_ascii	; + need
%endif					; } libasm_hex_04b


; } DavydovMA 2018061300
