; DavydovMA 2013040600 {
;	SOFT_FILE	"libasm_prn.asm
;	SOFT_NAME	"libasm_prn"
;	SOFT_VERSION	"19.02"
;	SOFT_COPYRIGHT	"Copyright 1990-2019"
;	SOFT_AUTHOR	"DavydovMA"
;	SOFT_URL	"http://domain"
;	SOFT_EMAIL	"dev-asm@domain"
;
; function:	libasm_prn_ascii
; function:	libasm_prn_ascii_msg


%include	"./inc.libasm/libasm_inc_arch.asm"


%ifndef	_libasm_prn		; _libasm_prn {
%define	_libasm_prn
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
%ifdef	DEBUG_libasm_prn	; DEBUG {
%include	"./inc.libasm/libasm_prn_debug.asm"
%endif				; } DEBUG
;
%ifdef	x86_32			; x86_32 {
%include	"./inc.libasm/libasm_prn_x86_32.asm"
%endif				; } x86_32
;
%ifdef	x86_64			; x86_64 {
%include	"./inc.libasm/libasm_prn_x86_64.asm"
%endif				; } x86_64
;
%include	"./inc.libasm/libasm_sys.asm"
;
%endif				; } _libasm_prn
; } defaults


; } DavydovMA 2019021800