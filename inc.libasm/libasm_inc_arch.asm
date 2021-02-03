; DavydovMA 2013040600 {
;	SOFT_FILE	"libasm_inc_arch.asm
;	SOFT_NAME	"libasm_inc_arch"
;	SOFT_VERSION	"1.0.0"
;	SOFT_COPYRIGHT	"Copyright 1990-2018"
;	SOFT_AUTHOR	"DavydovMA"
;	SOFT_URL	"http://domain"
;	SOFT_EMAIL	"dev@domain"


%ifndef	x86_ARCH	; x86_ARCH {
%define	x86_ARCH

%ifdef	i386		; i386 {
%define	x86_32
%endif			; } i386
%ifdef	i486		; i486 {
%define	x86_32
%endif			; } i486
%ifdef	i586		; i586 {
%define	x86_32
%endif			; } i586
%ifdef	i686		; i686 {
%define	x86_32
%endif			; } i686

%endif			; } x86_ARCH


; } DavydovMA 2018061200
