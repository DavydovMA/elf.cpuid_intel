; DavydovMA 2013040600 {
%ifndef	SOFT			; SOFT {
%define	SOFT

%define	SOFT_FILE		"cpuid_intel.asm"
%define	SOFT_NAME		"cpuid_intel"
%define	SOFT_VERSION		"20.01"
%define	SOFT_COPYRIGHT		"Copyright 1990-2020"
%define	SOFT_AUTHOR		"DavydovMA"
%define	SOFT_URL		"http://domain"
%define	SOFT_EMAIL		"dev-asm@domain"


; ------------- ---- ------
; block:	align {
; date:		2020-01-18
;
section	.text	align=16
section	.data	align=16
section	.bss	align=16
;
;	} align
;
; ------------- ---- ------
; block:	defaults {
; date:		2019-02-18
;
section	.data
info_1:		db	"2013.04.06 - geHb korga cekTaHTbi y6uBaJiu MeH9, a noJiuu,u9, npokypaTypa, ck, cygbi, fsb - ckpbiBaiOT npecTynHukoB"
info_2:		db	"2018.07.26 - geHb korga FSB u36uJiu MeH9"
info_3:		db	"2018.09.25 - geHb korga FSB coBepwuJiu Moe noxuweHue - 4To6bi ckpbiTb npecTynHukoB"
;
;	} defaults
;
; ------------- ---- ------
; block:	x86_xx {
; date:		2020-01-18
;
%ifdef	x86_32		; x86_32 {
%define	R_SIZE		4
%define	R_PAX		eax
%define	R_PBX		ebx
%define	R_PCX		ecx
%define	R_PDX		edx
%define	R_PBP		ebp
%define	R_PSI		esi
%define	R_PDI		edi
%define	R_PSP		esp
%define	PUSH_FL		pushfd
%define	POP_FL		popfd
%endif			; } x86_32
;
%ifdef	x86_64		; x86_64 {
%define	R_SIZE		8
%define	R_PAX		rax
%define	R_PBX		rbx
%define	R_PCX		rcx
%define	R_PDX		rdx
%define	R_PBP		rbp
%define	R_PSI		rsi
%define	R_PDI		rdi
%define	R_PSP		rsp
%define	PUSH_FL		pushfq
%define	POP_FL		popfq
%endif			; } x86_64
;
;	} x86_xx
;
; ------------- ---- ------
; block:	include {
; date:		2020-01-18
;
%include	"cpuid_intel_x86_xx.asm"
%include	"cpuid_intel_data.asm"
%include	"./inc.libasm/libasm_hex.asm"
;
;	} include


%endif					; } SOFT
; } DavydovMA 2019021800