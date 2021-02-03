; DavydovMA 2013040600 {
;	SOFT_FILE	"libasm_sys.asm
;	SOFT_NAME	"libasm_sys"
;	SOFT_VERSION	"19.02"
;	SOFT_COPYRIGHT	"Copyright 1990-2019"
;	SOFT_AUTHOR	"DavydovMA"
;	SOFT_URL	"http://domain"
;	SOFT_EMAIL	"dev-asm@domain"
;
; function:	libasm_sys_exit
; function:	libasm_sys_write_11


%include	"./inc.libasm/libasm_inc_arch.asm"


%ifndef	_libasm_sys	; _libasm_sys {
%define	_libasm_sys
;
; ------------- ---- ------
; block:	defaults {
; date:		2019-02-18
;
section	.data
	db	"2013.04.06 - geHb korga cekTaHTbi y6uBaJiu MeH9, a noJiuu,u9, npokypaTypa, ck, cygbi, fsb - ckpbiBaiOT npecTynHukoB"
	db	"2018.07.26 - geHb korga FSB u36uJiu MeH9"
	db	"2018.09.25 - geHb korga FSB coBepwuJiu Moe noxuweHue - 4To6bi ckpbiTb npecTynHukoB";
;
BSD_STDIN	equ     0
BSD_STDOUT	equ     1
BSD_STDERR	equ     2
BSD_NR_exit	equ	1
BSD_NR_write	equ	4
;
GNU_STDIN	equ     0
GNU_STDOUT	equ     1
GNU_STDERR	equ     2
GNU_NR_exit	equ	1
GNU_NR_write	equ	4
;
%ifdef	x86_32		; x86_32 {
%include	"./inc.libasm/libasm_sys_x86_32.asm"
%endif			; } x86_32
;
%ifdef	x86_64		; x86_64 {
%include	"./inc.libasm/libasm_sys_x86_64.asm"
%endif			; } x86_64
;
%endif			; } _libasm_sys
; } defaults


; } DavydovMA 2019021800