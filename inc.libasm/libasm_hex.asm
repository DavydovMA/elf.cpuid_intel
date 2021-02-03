; DavydovMA 2013040600 {
;	SOFT_FILE	"libasm_hex.asm
;	SOFT_NAME	"libasm_hex"
;	SOFT_VERSION	"19.02"
;	SOFT_COPYRIGHT	"Copyright 1990-2019"
;	SOFT_AUTHOR	"DavydovMA"
;	SOFT_URL	"http://domain"
;	SOFT_EMAIL	"dev-asm@domain"
;
; function:	libasm_hex_04b
; function:	libasm_hex_08b
; function:	libasm_hex_12b
; function:	libasm_hex_16b
; function:	libasm_hex_20b
; function:	libasm_hex_24b
; function:	libasm_hex_28b
; function:	libasm_hex_32b
; function:	libasm_hex_32bs
; function:	libasm_hex_08m
; function:	libasm_hex_16m
; function:	libasm_hex_32m
; function:	libasm_hex_64m
; function:	libasm_hex_80m
; function:	libasm_hex_128m
; function:	libasm_hex_256m
; function:	libasm_hex_512m
; function:	libasm_hex_128l


%include	"./inc.libasm/libasm_inc_arch.asm"


%ifndef	_libasm_hex		; _libasm_hex {
%define	_libasm_hex
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
%ifdef	DEBUG_libasm_hex	; DEBUG {
%include	"./inc.libasm/libasm_hex_debug.asm"
%endif				; } DEBUG
;
%ifdef  x86_32          	; x86_32 {
%include	"./inc.libasm/libasm_hex_x86_32.asm"
%endif                  	; } x86_32
;
%ifdef  x86_64          	; x86_64 {
%include	"./inc.libasm/libasm_hex_x86_64.asm"
%endif                  	; } x86_64
;
%include	"./inc.libasm/libasm_prn.asm"
;
%endif				; } _libasm_hex
; } defaults


; } DavydovMA 2019021800