; DavydovMA 2013040600 {
%ifndef	ASM_CPUID_INTEL_X86_XX			; ASM_CPUID_INTEL_X86_XX {
%define	ASM_CPUID_INTEL_X86_XX

%define	ASM_CPUID_INTEL_X86_XX_FILE		"cpuid_intel_x86_xx.asm"
%define	ASM_CPUID_INTEL_X86_XX_NAME		"cpuid_intel_x86_xx"
%define	ASM_CPUID_INTEL_X86_XX_VERSION		"20.01"
%define	ASM_CPUID_INTEL_X86_XX_COPYRIGHT	"Copyright 1990-2020"
%define	ASM_CPUID_INTEL_X86_XX_AUTHOR		"DavydovMA"
%define	ASM_CPUID_INTEL_X86_XX_URL		"http://domain"
%define	ASM_CPUID_INTEL_X86_XX_EMAIL		"dev-asm@domain"

section	.text

; ------------- ---- ------
; rem:		+ need
;
%define		_libasm_sys_exit
%define		_libasm_prn_ascii_msg
%define		_libasm_hex_04b
%define		_libasm_hex_08b
%define		_libasm_hex_12b
%define		_libasm_hex_16b
%define		_libasm_hex_20b
%define		_libasm_hex_32b
; ------------- ---- ------
; rem:		EQU
; date:		2020-01-18
;
%define	DISP_W		80-2-24		; DISPlay Width; dw=w-3*8(0x09); 80x*=56, 143x*=104
;
; ------------- ---- ------
; soft:		intel_cpuid
; rem:		CPUID full information
; date:		2019-02-21
; in:
; out:
;
global	_start
section	.data
section	.bss
section	.text
_start:
	mov	R_PAX, d_soft		; .soft
	call	f_prnmsg
	mov	R_PAX, d_title		; .title
	call	f_prnmsg
	mov	R_PAX, d_update		; .update
	call	f_prnmsg
	xor	R_PAX, R_PAX
	inc	R_PAX			; ERROR=1
	call	f_check			; .check.cpuid
	jnc	.soft_exit_99
	inc	R_PAX			; ERROR=2
	call	f_intel			; .check.indel
	jnc	.soft_exit_99
;	nop				; Basic CPUID Informaion
	mov	R_PAX, d_00_title
	call	f_prnmsg 
	xor	ecx, ecx
	dec	cl
	call	f_step
	call	f_prn00h		; .00h
	mov	ch, cl			; Maximum Input Value for Basic CPUID Information
	xor	cl, cl
	call	f_step
	jb	.soft_uni
	call	f_prn01h		; .01h
	call	f_step
	jb	.soft_uni
	call	f_prn02h		; .02h
	call	f_step
	jb	.soft_uni
	call	f_prn03h		; .03h
	call	f_step
	jb	.soft_uni
	call	f_prn04h		; .04h
	call	f_step
	jb	.soft_uni
	call	f_prn05h		; .05h
	call	f_step
	jb	.soft_uni
	call	f_prn06h		; .06h
	call	f_step
	jb	.soft_uni
	call	f_prn07h		; .07h
;	call	f_step
;	jb	.soft_uni		; .!.
	inc	cl
;	call	f_prn08h		; .08h.Undefined
	call	f_step
	jb	.soft_uni
	call	f_prn09h		; .09h
	call	f_step
	jb	.soft_uni
	call	f_prn0ah		; .0ah
	call	f_step
	jb	.soft_uni
	call	f_prn0bh		; .0bh
;	call	f_step
;	jb	.soft_uni		; .!.
	inc	cl
;	call	f_prn0ch		; .0ch.Undefined
	call	f_step
	jb	.soft_uni
; FIXME i don't have processor for check other mode's --->>> {
	call	f_prn0dh0		; .0dh0
	call	f_prn0dh1		; .0dh1
	call	f_prn0dh2		; .0dh2
;	call	f_step
;	jb	.soft_uni		; .!.
	inc	cl
;	call	f_prn0eh		; .0eh.Undefined
	call	f_step
	jb	.soft_uni
	call	f_prn0fh0		; .0fh0
	call	f_prn0fh1		; .0fh1
	call	f_step
	jb	.soft_uni
	call	f_prn10h0		; .10h0
	call	f_prn10h1		; .10h1
	call	f_prn10h2		; .10h2
	call	f_prn10h3		; .10h3
;	call	f_step
;	jb	.soft_uni		; .!.
	inc	cl
;	call	f_prn11h		; .11h.Undefined
	call	f_step
	jb	.soft_uni
	call	f_prn12h0		; .12h0
	call	f_prn12h1		; .12h1
	call	f_prn12h2		; .12h2
;	call	f_step
;	jb	.soft_uni		; .!.
	inc	cl
;	call	f_prn13h		; .13h.Undefined
	call	f_step
	jb	.soft_uni
	call	f_prn14h0		; .14h0
	call	f_prn14h1		; .14h1
	call	f_step
	jb	.soft_uni
	call	f_prn15h		; .15h
	call	f_step
	jb	.soft_uni
	call	f_prn16h		; .16h
	call	f_step
	jb	.soft_uni
	call	f_prn17h0		; .17h0
	call	f_prn17h1		; .17h1
;	call	f_prn17h4		; .17h4.Undefined
	call	f_step
	jb	.soft_uni
	call	f_prn18h		; .18h
.soft_uni:
;	nop				; Unimplemented CPUID Leaf Functions: 40000000H - 4FFFFFFFH
.soft_ext:
;	nop				; Extended Function CPUID Information
	mov	R_PAX, d_80_title
	call	f_prnmsg 
	xor	ecx, ecx
	dec	cl
	call	f_step
	call	f_prn80h		; .80000000h
	mov	ch, cl			; Maximum Input Value for Extended Function CPUID Information
	xor	cl, cl
	call	f_step
	jb	.soft_oth
	call	f_prn81h		; .80000001h
	call	f_step
	jb	.soft_oth
	call	f_prn82h		; .80000002h
	call	f_step
	jb	.soft_oth
	call	f_prn83h		; .80000003h
	call	f_step
	jb	.soft_oth
	call	f_prn84h		; .80000004h
;	call	f_step
;	jb	.soft_oth		; .!.
	inc	cl
;	call	f_prn85h		; .80000005h.Undefined
	call	f_step
	jb	.soft_oth
	call	f_prn86h		; .80000006h
	call	f_step
	jb	.soft_oth
	call	f_prn87h		; .80000007h
	call	f_step
	jb	.soft_oth
	call	f_prn88h		; .80000008h
.soft_oth:
	call	f_ext00			; .extended 00
	xor	R_PAX, R_PAX		; ERROR=0
.soft_exit_99:
	push	R_PAX
	mov	R_PAX, d_exit
	call	f_prnmsg
	pop	R_PAX
	jmp	libasm_sys_exit
	hlt
; off	GPLv3+:				; GPLv3+ {
	db	"DavydovMA GPLv3+"	; } GPLv3+
; ------------- ---- ------
; function:	f_prntabs
; rem:		print '\t' and '['
; date:		2020-01-18
; in:
; out:
;
section	.data
section	.bss
section	.text
f_prntabs:
	push	R_PAX
	mov	R_PAX, f_prntabs_00
	call	libasm_prn_ascii_msg
	pop	R_PAX
	ret
; ------------- ---- ------
; function:	f_prnsep
; rem:		print seperate
; date:		2018-06-18
; in:
; out:
;
section	.data
section	.bss
section	.text
f_prnsep:
	push	R_PAX
	mov	R_PAX, f_prnsep_00
	call	libasm_prn_ascii_msg
	pop	R_PAX
	ret
; ------------- ---- ------
; function:	f_prnhex
; rem:		print 'h' tag
; date:		2020-01-18
; in:
; out:
;
section	.data
section	.bss
section	.text
f_prnhex:
	push	R_PAX
	mov	al, 'h'
	call	libasm_prn_ascii
	pop	R_PAX
	ret
; ------------- ---- ------
; function:	f_prnmsg
; rem:		print MESSAGE and '\n'
; date:		2018-06-18
; in:
;	*AX	: message
; out:
;
section	.data
section	.bss
section	.text
f_prnmsg:
	push	R_PSI
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	cld
	mov	R_PSI, R_PAX		; ESI - pointer to text
	xor	eax, eax
	xor	ebx, ebx		; EBX - flag [:]
	xor	ecx, ecx		; ECX - width of line |:<--- WIDTH --->|
.f_prnmsg_00:
	or	ebx, ebx
	jnz	.f_prnmsg_01
	cmp	al, ':'
	jnz	.f_prnmsg_01
	mov	ebx, DISP_W
	mov	ecx, ebx
.f_prnmsg_01:
	dec	ecx
	jnz	.f_prnmsg_02
	mov	R_PAX, d_prnmsg_00
	call	libasm_prn_ascii_msg
	mov	ecx, ebx
.f_prnmsg_02:
	lodsb
	call	libasm_prn_ascii
	or	al, al
	jnz	.f_prnmsg_00
.f_prnmsg_99:
	mov	R_PAX, d_prnmsg_01
	call	libasm_prn_ascii_msg
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PSI
	ret
; ------------- ---- ------
; function:	f_prndec
; rem:		print in decimal
; date:		2020-01-18
; in:
;	EAX	: hex value
; out:
;
section	.data
section	.bss
section	.text
f_prndec:
	push	R_PCX			; 12 ^16	24 ^32
	push	R_PAX			; 8		16
	PUSH_FL				; 4		8
	push	R_PBP			; 0		0
	mov	R_PBP, R_PSP
	sub	R_PSP, 10
	fild	dword [ R_PBP + R_SIZE * 2 ]
	fbstp	[ R_PSP ]
	xor	eax, eax
	mov	R_PCX, 10
.f_prndec_00:
	mov	ah, byte [ R_PSP + R_PCX - 1 ]
	mov	al, ah
	shr	al, 4
	and	al, 0fh
	jnz	.f_prndec_01
	bt	eax, 16
	jnc	.f_prndec_02
.f_prndec_01:
	bts	eax, 16
	call	libasm_hex_04b
.f_prndec_02:
	mov	al, ah
	and	al, 0fh
	jnz	.f_prndec_03
	bt	eax, 16
	jnc	.f_prndec_04
.f_prndec_03:
	bts	eax, 16
	call	libasm_hex_04b
.f_prndec_04:
	loop	.f_prndec_00
	mov	R_PSP, R_PBP
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PCX
	ret
; ------------- ---- ------
; function:	f_prnnl
; rem:		print \n
; date:		2018-06-18
; in:
; out:
;
section	.data
section	.bss
section	.text
f_prnnl:
	push	R_PAX
	mov	R_PAX, d_prnnl_00
	call	libasm_prn_ascii_msg
	pop	R_PAX
	ret
; ------------- ---- ------
; function:	f_prnksp
; rem:		print ']' and \n
; date:		2018-06-18
; in:
; out:
;
section	.data
section	.bss
section	.text
f_prnksp:
	push	R_PAX
	mov	R_PAX, d_prnksp_00
	call	libasm_prn_ascii_msg
	pop	R_PAX
	ret
; ------------- ---- ------
; function:	f_prn32bit
; rem:		print MESSAGE from table if bit set, in while 32 bit
; date:		2018-06-18
; in:
;	*AX	: ADDR of table
;	EBX	: flags
; out:
;
section	.data
section	.bss
section	.text
f_prn32bit:
	push	R_PCX
	push	R_PAX
	PUSH_FL
	xor	ecx, ecx
.f_prn32bit_00:
	inc	R_PAX
	cmp	byte [ R_PAX ], ch
	jnz	.f_prn32bit_00
	inc	R_PAX
	bt	ebx, ecx
	jnc	.f_prn32bit_01
	call	f_prnmsg
.f_prn32bit_01:
	inc	cl
	cmp	cl, 32
	jnz	.f_prn32bit_00
	POP_FL
	pop	R_PAX
	pop	R_PCX
	ret
; ------------- ---- ------
; function:	f_prn4tbl
; rem:		EAX print MESSAGE from table in EDI
; date:		2018-06-18
; in:
;	EAX	: 4 INDEX
;	*DI	: ADDR of table
; out:
;
section	.data
section	.bss
section	.text
f_prn4tbl:
	push	R_PAX
	PUSH_FL
	call	f_prn1tbl
	ror	eax, 8
	call	f_prn1tbl
	ror	eax, 8
	call	f_prn1tbl
	ror	eax, 8
	call	f_prn1tbl
	POP_FL
	pop	R_PAX
	ret
; ------------- ---- ------
; function:	f_prn1tbl
; rem:		print text from table in EDI on AL INDEX
; date:		2018-06-18
; in:
;	AL	: INDEX
;	*DI	: ADDR of table
; out:
;
section	.data
section	.bss
section	.text
f_prn1tbl:
	push	R_PDI
	push	R_PAX
	PUSH_FL
	or	al, al			; 00 not print
	jz	.f_prn1tbl_99
	inc	al
	mov	ah, al			; ah <- index
	xor	al, al			; al <- 00
	cld
.f_prn1tbl_00:
	scasb
	jnz	.f_prn1tbl_00
	dec	ah
	jnz	.f_prn1tbl_00
	mov	R_PAX, R_PDI
	call	f_prnmsg
.f_prn1tbl_99:
	POP_FL
	pop	R_PAX
	pop	R_PDI
	ret
; ------------- ---- ------
; function:	f_step
; rem:		print step
; date:		2019-02-21
; in:
;	CH	: Maximum Value
;	CL	: Current Value
; out:
;	CL	: +1
;	EFLAGS
;
section	.data
section	.bss
section	.text
f_step:
	inc	cl
	cmp	ch, cl
	jb	.f_step_99
	push	R_PAX
	mov	al, '['
	call	libasm_prn_ascii
	mov	al, ch
	call	libasm_hex_08b
	mov	al, '-'
	call	libasm_prn_ascii
	mov	al, cl
	call	libasm_hex_08b
	mov	al, ']'
	call	libasm_prn_ascii
	call	f_prnsep
	pop	R_PAX
.f_step_99:
	cmp	ch, cl
	ret
; ------------- ---- ------
; function:	f_check
; rem:		check support cpuid
; date:		2018-06-18
; in:
; out:
;	CF
;	0	: not support (no)
;	1	: support (yes)
;
section	.data
section	.bss
section	.text
f_check:
	push	R_PAX
	call	f_prntabs
	PUSH_FL
	pop	R_PAX
	bts	eax, 21			; bit-21 set to 1
	push	R_PAX			; 1 >
	POP_FL
	PUSH_FL
	pop	R_PAX
	btr	eax, 21			; bit-21 set to 0
	jc	.f_check_01
.f_check_00:
	mov	R_PAX, d_check_not
	call	f_prnmsg
	clc
	pop	R_PAX
	ret
.f_check_01:
	push	R_PAX			; 0 >
	POP_FL
	PUSH_FL
	pop	R_PAX
	bt	eax, 21
	jc	.f_check_00
	mov	R_PAX, d_check_yes
	call	f_prnmsg
	stc
	pop	R_PAX
	ret
; ------------- ---- ------
; function:	f_intel
; rem:		check intel
; date:		2019-02-21
; in:
; out
;	CF
;	0	: not support (no)
;	1	: support (yes)
;
section	.data
section	.bss
section	.text
f_intel:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
;	PUSH_FL				; .!.
	call	f_prntabs
	xor	R_PAX, R_PAX
	cpuid
	mov	R_PAX, d_intel_not
	cmp	ebx, 756E6547h
	clc
	jnz	.f_intel_99
	cmp	ecx, 6C65746Eh
	clc
	jnz	.f_intel_99
	cmp	edx, 49656E69h
	clc
	jnz	.f_intel_99
	mov	R_PAX, d_intel_yes
	stc
.f_intel_99:
	call	f_prnmsg
;	POP_FL				; .!.
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; off	GPLv3+:				; GPLv3+ {
	db	"DavydovMA GPLv3+"	; } GPLv3+
; ------------- ---- ------
; function:	f_prn00h
; rem:		print BLOCK 00h
; date:		2020-01-18
; in:
; out
;	ECX	; Maximum Input Value for CPUID Information
;
section	.data
section	.bss
section	.text
f_prn00h:
	push	R_PDX			; 20 ^24	40 ^48
	push	R_PCX			; 16		32
	push	R_PBX			; 12		24
	push	R_PAX			; 8		16
	PUSH_FL				; 4		8
	push	R_PBP			; 0
	mov	R_PBP, R_PSP
	xor	eax, eax
	cpuid
%ifdef	x86_32				; x86_32 {
	push	R_PAX
	push	R_PDX
	push	R_PCX
;)	push	R_PBX
%endif					; } x86_32
%ifdef	x86_64				; x86_64 {
	rol	R_PDX, 32
	or	R_PDX, R_PAX
	rol	R_PDX, 32
	push	R_PDX
	rol	R_PCX, 32
	or	R_PBX, R_PCX
;)	push	R_PBX
%endif					; } x86_64
	push	R_PBX
	mov	ecx, eax		; Maximum Input Value for Basic CPUID Information
	call	f_prntabs
	call	libasm_hex_32b
	call	f_prnhex
	mov	byte [ R_PSP + 12 ], 0
	mov	R_PAX, d_00heax0031
	call	f_prnmsg
	call	f_prntabs		; .00h.EAXEBXECXEDX
	mov	R_PAX, R_PSP
	call	libasm_prn_ascii_msg
	call	f_prnksp
	mov	R_PSP, R_PBP
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
;	pop	R_PCX
	pop	R_PDX	
	pop	R_PDX	
	ret
; ------------- ---- ------
; function:	f_prn01h
; rem:		print BLOCK 01h
; date:		2019-02-21
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn01h:
	push	R_PSI
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_01h		; .01h
	call	f_prnmsg
	mov	eax, 01h
	cpuid
	mov	ebp, eax
	call	f_prntabs		; .01h.EAX.1213
	mov	R_PSI, d_01heax121300
	shr	eax, 12
	and	eax, 03h
	jz	.f_prn01h_00
	mov	R_PSI, d_01heax121301
	dec	eax
	jz	.f_prn01h_00
	mov	R_PSI, d_01heax121310
	dec	eax
	jz	.f_prn01h_00
	mov	R_PSI, d_01heax121311
.f_prn01h_00:
	mov	R_PAX, R_PSI
	call	libasm_prn_ascii_msg	;!FY
	mov	R_PAX, d_01heax1213	;!FY
	call	f_prnmsg
	call	f_prntabs		; .01h.EAX.0811
	mov	eax, ebp
	shr	eax, 8
	and	eax, 0fh
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_01heax0811
	call	f_prnmsg
	call	f_prntabs		; .01h.EAX.2027
	mov	eax, ebp
	shr	eax, 20
	and	eax, 0ffh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_01heax2027
	call	f_prnmsg
	call	f_prntabs		; .01h.EAX.0407
	mov	eax, ebp
	shr	eax, 4
	and	eax, 0fh
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_01heax0407
	call	f_prnmsg
	call	f_prntabs		; .01h.EAX.1619
	mov	eax, ebp
	shr	eax, 16
	and	eax, 0fh
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_01heax1619
	call	f_prnmsg
	call	f_prntabs		; .01h.EAX.0003
	mov	eax, ebp
	and	eax, 0fh
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_01heax0003
	call	f_prnmsg
	call	f_prntabs		; F-M-S
	mov	eax, ebp		; F
	shr	eax, 8
	and	eax, 0fh
	mov	esi, eax
	cmp	eax, 0fh
	jnz	.f_prn01h_01
	mov	eax, ebp
	shr	eax, 20
	and	eax, 0ffh
	add	eax, esi
.f_prn01h_01:
	call	libasm_hex_12b
	call	f_prnhex
	mov	al, '-'
	call	libasm_prn_ascii
	mov	eax, ebp		; M
	shr	eax, 4
	and	eax, 0fh
	cmp	esi, 0fh
	jz	.f_prn01h_02
	cmp	esi, 06h
	jnz	.f_prn01h_03
.f_prn01h_02:
	mov	esi, ebp
	shr	esi, 16
	and	esi, 0fh
	shl	esi, 4
	add	eax, esi
.f_prn01h_03:
	call	libasm_hex_08b
	call	f_prnhex
	mov	al, '-'
	call	libasm_prn_ascii
	mov	eax, ebp		; S
	and	eax, 0fh
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_01heaxFMS
	call	f_prnmsg
	call	f_prntabs		; .01h.EBX.0007
	mov	eax, ebx
	and	eax, 0ffh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_01hebx0007
	call	f_prnmsg
	call	f_prntabs		; .01h.EBX.0815
	mov	eax, ebx
	shr	eax, 8
	and	eax, 0ffh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_01hebx0815
	call	f_prnmsg
	call	f_prntabs		; .01h.EBX.1623
	mov	eax, ebx
	shr	eax, 16
	and	eax, 0ffh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_01hebx1623
	call	f_prnmsg
	call	f_prntabs		; .01h.EBX.2431
	mov	eax, ebx
	shr	eax, 24
	and	eax, 0ffh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_01hebx2431
	call	f_prnmsg
	mov	R_PAX, d_01hecxedx	; .01h.ECX.0031.flag32bit
	call	f_prnmsg
	mov	R_PAX, d_01hecx
	mov	ebx, ecx
	call	f_prn32bit
	call	f_prnsep		; .01h.EDX.0031.flag32bit
	mov	R_PAX, d_01hedx
	mov	ebx, edx
	call	f_prn32bit
	bt	edx, 28
	jc	.f_prn01h_04
	mov	R_PAX, d_01hedx280	; .01h.EDX.28 = 0
	call	f_prnmsg
.f_prn01h_04:
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	pop	R_PSI
	ret
; ------------- ---- ------
; function:	f_prn02h
; rem:		print BlOCK 02h
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn02h:
	push	R_PDI
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	mov	R_PAX, d_02h		; .02h
	call	f_prnmsg
	mov	R_PDI, R_PAX
	mov	eax, 02h
	cpuid
	and	eax, 0ffffff00h		; The least-significant byte (byte 0) of register EAX is set to 01H. This value should be ignored.
	call	f_prn4tbl		; .02h.EAX.0831
	mov	eax, ebx
	call	f_prn4tbl		; .02h.EBX.0031
	mov	eax, ecx
	call	f_prn4tbl		; .02h.ECX.0031
	mov	eax, edx
	call	f_prn4tbl		; .02h.EDX.0031
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	pop	R_PDI
	ret
; ------------- ---- ------
; function:	f_prn03h
; rem:		print BLOCK 03h
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn03h:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
;	PUSH_FL				; .!.
	mov	R_PAX, d_03h		; .03h
	call	f_prnmsg
	mov	eax, 03h
	cpuid
	call	f_prntabs		; .03h.EDXECX
	mov	eax, edx
	call	libasm_hex_32b
;	call	f_prnhex
	mov	eax, ecx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_03h0063
	call	f_prnmsg
;	POP_FL				; .!.
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn04h
; rem:		print BLOCK 04h
; date:		2019-12-31
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn04h:
	push	R_PDI
	push	R_PSI
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_04h		; .04h
	call	f_prnmsg
	xor	esi, esi
.f_prn04h_00:
	mov	eax, 04h
	mov	ecx, esi
	cpuid
	mov	ebp, eax
	and	eax, 1fh
	jz	.f_prn04h_99
	call	f_prnsep
	mov	eax, ebp		; .04h.EAX.0004
	mov	R_PDI, d_04heax00040
	and	eax, 1fh
	jz	.f_prn04h_01
	mov	R_PDI, d_04heax00041
	dec	eax
	jz	.f_prn04h_01
	mov	R_PDI, d_04heax00042
	dec	eax
	jz	.f_prn04h_01
	mov	R_PDI, d_04heax00043
	dec	eax
	jz	.f_prn04h_01
	mov	R_PDI, d_04heax0004x
.f_prn04h_01:
	mov	R_PAX, R_PDI
	call	libasm_prn_ascii_msg
	mov	R_PAX, d_04heax0004
	call	f_prnmsg
	call	f_prntabs		; .04h.EAX.0507
	mov	eax, ebp
	shr	eax, 4
	and	eax, 07h		; Bits 07 - 05: Cache Level
	shr	eax, 1			; fix.20191231{ Cache Level (starts at 1) }
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_04heax0507
	call	f_prnmsg
	bt	ebp, 8			; .04h.EAX.08
	jnc	.f_prn04h_02
	mov	R_PAX, d_04heax08
	call	f_prnmsg
.f_prn04h_02:
	bt	ebp, 9			; ,04h.EAX.09
	jnc	.f_prn04h_03
	mov	R_PAX, d_04heax09
	call	f_prnmsg
.f_prn04h_03:
;	nop				; .04h.EAX.1013.Reserved
	call	f_prntabs		; .04h.EAX.1425
	mov	eax, ebp
	shr	eax, 14
	and	eax, 0fffh
	inc	eax			; ** Add one to the return value to get the result.
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_04heax1425
	call	f_prnmsg
	call	f_prntabs		; .04h.EAX.2631
	mov	eax, ebp
	shr	eax, 26
	and	eax, 03fh
	inc	eax			; ** Add one to the return value to get the result.
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_04heax2631
	call	f_prnmsg
	mov	ebp, ebx		; .04h.EBX
	call	f_prntabs		; .04h.EBX.0011
	mov	eax, ebp
	and	eax, 0fffh
	inc	eax			; ** Add one to the return value to get the result.
	mov	edi, eax
	call	libasm_hex_16b
	call	f_prnhex
	mov	ebx, eax		; csb1
	mov	R_PAX, d_04hebx0011
	call	f_prnmsg
	call	f_prntabs
	mov	eax, edi
	call	f_prndec
	call	f_prnksp
	call	f_prntabs		; .04h.EBX.1221
	mov	eax, ebp
	shr	eax, 12
	and	eax, 03ffh
	inc	eax			; ** Add one to the return value to get the result.
	mov	edi, eax
	call	libasm_hex_16b
	call	f_prnhex
	xchg	eax, ebx		; csb2
	mul	bx
	mov	ebx, eax
	mov	R_PAX, d_04hebx1221
	call	f_prnmsg
	call	f_prntabs
	mov	eax, edi
	call	f_prndec
	call	f_prnksp
	call	f_prntabs		; .04h.EBX.2231
	mov	eax, ebp
	shr	eax, 22
	and	eax, 03ffh
	inc	eax			; ** Add one to the return value to get the result.
	mov	edi, eax
	call	libasm_hex_16b
	call	f_prnhex
	xchg	eax, ebx		; csb3
	mul	bx
	mov	ebx, eax
	mov	R_PAX, d_04hebx2231
	call	f_prnmsg
	call	f_prntabs
	mov	eax, edi
	call	f_prndec
	call	f_prnksp
	call	f_prntabs		; .04h.ECX
	inc	ecx			; ** Add one to the return value to get the result.
	mov	eax, ecx
	mov	edi, eax
	call	libasm_hex_32b
	call	f_prnhex
	mov	eax, ebx		; csb4
	mul	ecx
	mov	ebx, eax
	mov	R_PAX, d_04hecx
	call	f_prnmsg
	call	f_prntabs
	mov	eax, edi
	call	f_prndec
	call	f_prnksp
	call	f_prntabs		; .04h.EBXECX
	mov	eax, ebx		;! EDX skipped
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_04hebxecx
	call	f_prnmsg
	call	f_prntabs
	mov	eax, ebx
	call	f_prndec
	call	f_prnksp
	mov	edx, edi		; .04h.EDX
	mov	R_PAX, d_04hedx00	; .04h.EDX.00
	bt	edx, 0
	jnc	.f_prn04h_04
	mov	R_PAX, d_04hedx01
.f_prn04h_04:
	call	f_prnmsg
	mov	R_PAX, d_04hedx10	; .04h.EDX.01
	bt	edx, 1
	jnc	.f_prn04h_05
	mov	R_PAX, d_04hedx11
.f_prn04h_05:
	call	f_prnmsg
	mov	R_PAX, d_04hedx20	; .04h.EDX.02
	bt	edx, 2
	jnc	.f_prn04h_06
	mov	R_PAX, d_04hedx21
.f_prn04h_06:
	call	f_prnmsg
;	nop				; .04h.EDX.0331.Reserved
;	mov	eax, esi
;	call	libasm_hex_32b
;	mov	al, 0dh
;	call	libasm_prn_ascii
	inc	esi
	jmp	.f_prn04h_00
.f_prn04h_99:
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	pop	R_PSI
	pop	R_PDI
	ret
; ------------- ---- ------
; function:	f_prn05h
; rem:		print BLOCK 05h
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn05h:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	mov	R_PAX, d_05h		; .05h
	call	f_prnmsg
	mov	eax, 05h
	cpuid
	call	f_prntabs		; .05h.EAX.0015.Smallest monitor-line size in bytes (default is processor's monitor granularity).
	and	eax, 0ffffh
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_05heax0015
	call	f_prnmsg
;	nop				; .05h.EAX.1631.Reserved
	call	f_prntabs		; .05h.EBX.0015.Largest monitor-line size in bytes (default is processor's monitor granularity).
	mov	eax, ebx
	and	eax, 0ffffh
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_05hebx0015
	call	f_prnmsg
;	nop				; .05h.EBX.1631.Reserved
	bt	ecx, 0			; .05h.ECX.00
	jnc	.f_prn05h_00
	mov	R_PAX, d_05hecx00
	call	f_prnmsg
.f_prn05h_00:
	bt	ecx, 1			; .05h.ECX.01
	jnc	.f_prn05h_01
	mov	R_PAX, d_05hecx01
	call	f_prnmsg
.f_prn05h_01:
;	nop				; .05h.ECX.0231.Reserved
	call	f_prntabs		; .05h.EDX.0003
	mov	eax, edx
;	and	eax, 0fh		; .!.
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_05hedx0003
	call	f_prnmsg
	call	f_prntabs		; .05h.EDX.0407
	mov	eax, edx
	shr	eax, 4
;	and	eax, 0fh		; .!.
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_05hedx0407
	call	f_prnmsg
	call	f_prntabs		; .05h.EDX.0811
	mov	eax, edx
	shr	eax, 8
;	and	eax, 0fh		; .!.
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_05hedx0811
	call	f_prnmsg
	call	f_prntabs		; .05h.EDX.1215
	mov	eax, edx
	shr	eax, 12
;	and	eax, 0fh		; .!.
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_05hedx1215
	call	f_prnmsg
	call	f_prntabs		; .05h.EDX.1619
	mov	eax, edx
	shr	eax, 16
;	and	eax, 0fh		; .!.
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_05hedx1619
	call	f_prnmsg
	call	f_prntabs		; .05h.EDX.2023
	mov	eax, edx
	shr	eax, 20
;	and	eax, 0fh		; .!.
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_05hedx2023
	call	f_prnmsg
	call	f_prntabs		; .05h.EDX.2427
	mov	eax, edx
	shr	eax, 24
;	and	eax, 0fh		; .!.
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_05hedx2427
	call	f_prnmsg
	call	f_prntabs		; .05h.EDX.2831
	mov	eax, edx
	shr	eax, 28
;	and	eax, 0fh		; .!.
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_05hedx2831
	call	f_prnmsg
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn06h
; rem:		print BLOCK 06h
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn06h:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_06h		; .06h
	call	f_prnmsg
	mov	eax, 06h
	cpuid
	mov	ebp, ebx
	mov	ebx, eax		; .06h.EAX.0031.flag32bit
	mov	R_PAX, d_06heax
	call	f_prn32bit
	call	f_prntabs		; .06h.EBX.0003
	mov	eax, ebp
	and	eax, 0fh
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_06hebx0003
	call	f_prnmsg
;	nop				; .06h.EBX.0432.Reserved
	bt	ecx, 0			; .06h.ECX.00
	jnc	.f_prn06h_00
	mov	R_PAX, d_06hecx00
	call	f_prnmsg
.f_prn06h_00:
;	nop				; .06h.ECX.0102.Reserved
	bt	ecx, 3			; .06h.ECX.03
	jnc	.f_prn06h_01
	mov	R_PAX, d_06hecx03
	call	f_prnmsg
.f_prn06h_01:
;	nop				; .06h.ECX.0431.Reserved
;	nop				; .06h.EDX.0031.Reserved
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn07h
; rem:		print BLOCK 07h
; date:		2020-02-21
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn07h:
	push	R_PSI
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_07h		; .07h
	call	f_prnmsg
	xor	esi, esi
.f_prn07h_00:
	mov	ecx, esi
	mov	eax, 07h
	cpuid
	or	eax, eax
	jnz	.f_prn07h_01
	or	ebx, ebx
	jnz	.f_prn07h_01
	or	ecx, ecx
	jnz	.f_prn07h_01
	or	edx, edx
	jz	.f_prn07h_99
.f_prn07h_01:
	call	f_prnsep
	call	f_prntabs		; .07h.EAX.0031
	call	libasm_hex_32b
	call	f_prnhex
	or	eax, eax
	PUSH_FL
	mov	R_PAX, d_07heax
	call	f_prnmsg
	POP_FL
	jz	.f_prn07h_99
	mov	R_PAX, d_07hebx		; .07h.EBX.0031.flag32bit
	call	f_prn32bit
	bt	ecx, 0			; .07h.ECX.00
	jnc	.f_prn07h_02
	mov	R_PAX, d_07hecx00
	call	f_prnmsg
.f_prn07h_02:
	bt	ecx, 1			; .07h.ECX.01
	jnc	.f_prn07h_03
	mov	R_PAX, d_07hecx01
	call	f_prnmsg
.f_prn07h_03:
	bt	ecx, 2			; .07h.ECX.02
	jnc	.f_prn07h_04
	mov	R_PAX, d_07hecx02
	call	f_prnmsg
.f_prn07h_04:
	bt	ecx, 3			; .07h.ECX.03
	jnc	.f_prn07h_05
	mov	R_PAX, d_07hecx03
	call	f_prnmsg
.f_prn07h_05:
	bt	ecx, 4			; .07h.ECX.04
	jnc	.f_prn07h_06
	mov	R_PAX, d_07hecx04
	call	f_prnmsg
.f_prn07h_06:
;	nop				; .07h.ECX.0515.Reserved
	call	f_prntabs		; .07h.ECX.1721
	mov	eax, ecx
	shr	eax, 17
	and	eax, 1fh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_07hecx1721
	call	f_prnmsg
	bt	ecx, 22			; .07h.ECX.22
	jnc	.f_prn07h_07
	mov	R_PAX, d_07hecx22
	call	f_prnmsg
.f_prn07h_07:
;	nop				; .07h.ECX.2329.Reserved
	bt	ecx, 30			; .07h.ECX.30
	jnc	.f_prn07h_08
	mov	R_PAX, d_07hecx30
	call	f_prnmsg
.f_prn07h_08:
;	nop				; .07h.ECX.31.Reserved
;	nop				; .07h.EDX.0031.Reserved
;	mov	eax, esi
;	call	libasm_hex_32b
;	mov	al, 0dh
;	call	libasm_prn_ascii
	inc	esi
	jmp	.f_prn07h_00
.f_prn07h_99:
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	pop	R_PSI
	ret
; Undefined	; ------------- ---- ------
; Undefined	; function:	f_prn08h
; Undefined	; rem:		print BLOCK 08h
; Undefined	; date:		2018-06-18
; Undefined	; in:
; Undefined	; out
; Undefined	;
; Undefined	section	.data
; Undefined	section	.bss
; Undefined	section	.text
; Undefined	f_prn08h:
; Undefined		push	R_PDX
; Undefined		push	R_PCX
; Undefined		push	R_PBX
; Undefined		push	R_PAX
; Undefined	;	PUSH_FL				; .!.
; Undefined		mov	R_PAX, d_08h
; Undefined		call	f_prnmsg
; Undefined		mov	eax, 08h
; Undefined		cpuid
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined		mov	eax, ebx
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined		mov	eax, ecx
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined		mov	eax, edx
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined	;	POP_FL				; .!.
; Undefined		pop	R_PAX
; Undefined		pop	R_PBX
; Undefined		pop	R_PCX
; Undefined		pop	R_PDX
; Undefined		ret
; ------------- ---- ------
; function:	f_prn09h
; rem:		print BLOCK 09h
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn09h:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
;	PUSH_FL				; .!.
	mov	R_PAX, d_09h		; .09h
	call	f_prnmsg
	mov	eax, 09h
	cpuid
	call	f_prntabs		; .09h.EAX.0031
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_09heax0031
	call	f_prnmsg
;	nop				; .09h.EBX.0031.Reserved
;	nop				; .09h.ECX.0031.Reserved
;	nop				; .09h.EDX.0031.Reserved
;	POP_FL				; .!.
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn0ah
; rem:		print BLOCK 0ah
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn0ah:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_0ah		; .0ah
	call	f_prnmsg
	mov	eax, 0ah
	cpuid
	mov	ebp, eax
	call	f_prntabs		; .0ah.EAX.0007
;)	and	eax, 0ffh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_0aheax0007
	call	f_prnmsg
	call	f_prntabs		; .0ah.EAX.0815
	mov	eax, ebp
	shr	eax, 8
;)	and	eax, 0ffh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_0aheax0815
	call	f_prnmsg
	call	f_prntabs		; .0ah.EAX.1623
	mov	eax, ebp
	shr	eax, 16
;)	and	eax, 0ffh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_0aheax1623
	call	f_prnmsg
	call	f_prntabs		; .0ah.EAX.24-31
	mov	eax, ebp
	shr	eax, 24
;)	and	eax, 0ffh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_0aheax2431
	call	f_prnmsg
	mov	R_PAX, d_0ahebx		; .0ah.EBX.0031.flag32bit
	call	f_prn32bit
;	nop				; .0ah.ECX.0031.Reserved
	call	f_prntabs		; .0ah.EDX.0004
	mov	eax, edx
	and	eax, 1fh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_0ahedx0004
	call	f_prnmsg
	call	f_prntabs		; .0ah.EDX.0512
	mov	eax, edx
	shr	eax, 5
;)	and	eax, 0ffh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_0ahedx0512
	call	f_prnmsg
;	nop				; .0ah.EDX.1314
	bt	edx, 15			; .0ah.EDX.15
	jnc	.f_prn0ah_00
	mov	R_PAX, d_0ahedx15
	call	f_prnmsg
.f_prn0ah_00:
;	nop				; .0ah.EDX.1631
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn0bh
; rem:		print BLOCK 0bh
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn0bh:
	push	R_PSI
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_0bh		; .0bh
	call	f_prnmsg
	xor	esi, esi
.f_prn0bh_00:
	mov	ecx, esi
	mov	eax, 0bh
	cpuid
	mov	ebp, ecx
	and	ebp, 0ff00h
	jz	.f_prn0bh_03
	call	f_prnsep
	call	f_prntabs		; .0bh.EAX.0004
	and	eax, 1fh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_0bheax0004
	call	f_prnmsg
;	nop				; .0bh.EAX,0531,Reserved
	call	f_prntabs		; .0bh.EBX.0015
	mov	eax, ebx
;	and	eax, 0ffffh		; .!.
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_0bhebx0015
	call	f_prnmsg
;	nop				; .0bh.EBX.1631.Reserved
	call	f_prntabs		; .0bh.ECX.0007
	mov	eax, ecx
;	and	eax, 0ffh		; .!.
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_0bhecx0007
	call	f_prnmsg
	call	f_prntabs		; .0bh.ECX.0815
	mov	eax, ecx
	shr	eax, 8
	and	eax, 0ffh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PBX, d_0bhecx08150
	or	eax, eax
	jz	.f_prn0bh_01
	mov	R_PBX, d_0bhecx08151
	dec	eax
	jz	.f_prn0bh_01
	mov	R_PBX, d_0bhecx08152
	dec	eax
	jz	.f_prn0bh_01
	mov	R_PBX, d_0bhecx0815x
.f_prn0bh_01:
	mov	R_PAX, R_PBX
	call	f_prnmsg
;	nop				; .0bh.ECX.1631.Reserved
	call	f_prntabs		; .0bh.EDX.0031
	mov	eax, edx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_0bhedx0031
	call	f_prnmsg
	inc	esi
	cmp	esi, 100h		; ECX.0007
	jnz	.f_prn0bh_00
.f_prn0bh_03:
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	pop	R_PSI
	ret
; Undefined	; ------------- ---- ------
; Undefined	; function:	f_prn0ch
; Undefined	; rem:		print BLOCK 0ch
; Undefined	; date:		2018-06-18
; Undefined	; in:
; Undefined	; out
; Undefined	;
; Undefined	section	.data
; Undefined	section	.bss
; Undefined	section	.text
; Undefined	f_prn0ch:
; Undefined		push	R_PDX
; Undefined		push	R_PCX
; Undefined		push	R_PBX
; Undefined		push	R_PAX
; Undefined	;	PUSH_FL				; .!.
; Undefined		mov	R_PAX, d_0ch
; Undefined		call	f_prnmsg
; Undefined		mov	R_PAX, 0ch
; Undefined		cpuid
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined		mov	eax, ebx
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined		mov	eax, ecx
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined		mov	eax, edx
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined	;	POP_FL				; .!.
; Undefined		pop	R_PAX
; Undefined		pop	R_PBX
; Undefined		pop	R_PCX
; Undefined		pop	R_PDX
; Undefined		ret
; ------------- ---- ------
; function:	f_prn0dh0
; rem:		print BLOCK 0dh0
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn0dh0:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_0dh0
	call	f_prnmsg
;	mov	ecx, 0			; .!.
	xor	ecx, ecx
	mov	eax, 0dh
	cpuid
	mov	ebp, ebx
	call	f_prnsep		; .0dh0.EAX.0031.flag32bit
	mov	ebx, eax
	mov	R_PAX, d_0dh0eax
	call	f_prnmsg
	call	f_prn32bit
	call	f_prntabs		; .0dh0.EBX.0031
	mov	eax, ebp
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_0dh0ebx0031
	call	f_prnmsg
	call	f_prntabs		; .0dh0.ECX.0031
	mov	eax, ecx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_0dh0ecx0031
	call	f_prnmsg
	call	f_prnsep		; .0dh0.EDX.0031.flag32bit
	mov	ebx, edx
	mov	R_PAX, d_0dh0edx
	call	f_prnmsg
	call	f_prn32bit
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn0dh1
; rem:		print BLOCK 0dh1
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn0dh1:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_0dh1
	call	f_prnmsg
	mov	ecx, 1
	mov	eax, 0dh
	cpuid
	mov	ebp, ebx
	mov	ebx, eax		; .0dh1.EAX.0031.flag32bit
	mov	R_PAX, d_0dh1eax
	call	f_prn32bit
	call	f_prntabs		; .0dh1.EBX.0031
	mov	eax, ebp
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_0dh1ebx0031
	call	f_prnmsg
	call	f_prnsep		; .0dh1.ECX.0031.flag32bit
	mov	ebx, ecx
	mov	R_PAX, d_0dh1ecx
	call	f_prnmsg
	call	f_prn32bit
	call	f_prnsep		; .0dh1.EDX.0031.flag32bit
	mov	ebx, edx
	mov	R_PAX, d_0dh1edx
	call	f_prnmsg
	call	f_prn32bit
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn0dh2
; rem:		print BLOCK 0dh2
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn0dh2:
	push	R_PSI
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_0dh2
	call	f_prnmsg
	mov	esi, 2
.f_prn0dh2_00:
	mov	ecx, esi
	mov	eax, 0dh
	cpuid
	or	eax, eax
	jz	.f_prn0dh2_05
	or	ebx, ebx
	jz	.f_prn0dh2_05
	or	ecx, ecx
	jz	.f_prn0dh2_05
	or	edx, edx
	jz	.f_prn0dh2_05
	cmp	esi, 31
	ja	.f_prn0dh2_01
	bt	eax, esi		; 2-31
	jc	.f_prn0dh2_02
	bt	ecx, esi
	jc	.f_prn0dh2_02
	jmp	.f_prn0dh2_05
.f_prn0dh2_01:				; 32-64
	mov	ebp, esi
	sub	ebp, 32
	bt	edx, ebp
	jnc	.f_prn0dh2_05
.f_prn0dh2_02:
	mov	ebp, eax
	call	f_prnsep
	call	f_prntabs
	mov	eax, esi
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_0dh2n
	call	f_prnmsg
	call	f_prntabs		; .0dh2.EAX.0031
	mov	eax, ebp
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_0dh2eax0031
	call	f_prnmsg
	call	f_prntabs		; .0dh2.EBX.0031
	mov	eax, ebx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_0dh2ebx0031
	call	f_prnmsg
	bt	ecx, 0			; .0dh2.ECX.00
	mov	R_PAX, d_0dh2ecx000
	jnc	.f_prn0dh2_03
	mov	R_PAX, d_0dh2ecx001
.f_prn0dh2_03:
	call	f_prnmsg
	bt	ecx, 1			; .0dh2.ECX.01
	jnc	.f_prn0dh2_04
	mov	R_PAX, d_0dh2ecx01
	call	f_prnmsg
.f_prn0dh2_04:
;	nop				; .0dh2.ECX.0231.Reserved.reports
;	nop				; .0dh2.EDX.0031.Reserved.reports
.f_prn0dh2_05:
	inc	esi
	cmp	esi, 64
	jnz	.f_prn0dh2_00
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	pop	R_PSI
	ret
; Udefined	; ------------- ---- ------
; Udefined	; function:	f_prn0eh
; Udefined	; rem:		print BLOCK 0eh
; Udefined	; date:		2018-06-18
; Udefined	; in:
; Udefined	; out
; Udefined	;
; Udefined	section	.data
; Udefined	section	.bss
; Udefined	section	.text
; Udefined	f_prn0eh:
; Udefined		push	R_PDX
; Udefined		push	R_PCX
; Udefined		push	R_PBX
; Udefined		push	R_PAX
; Udefined	;	PUSH_FL				; .!.
; Udefined		mov	R_PAX, d_0eh
; Udefined		call	f_prnmsg
; Udefined		mov	eax, 0eh
; Udefined		cpuid
; Udefined		call	f_prntabs
; Udefined		call	libasm_hex_32b
; Udefined		call	f_prnhex
; Udefined		call	f_prnksp
; Udefined		mov	eax, ebx
; Udefined		call	f_prntabs
; Udefined		call	libasm_hex_32b
; Udefined		call	f_prnhex
; Udefined		call	f_prnksp
; Udefined		mov	eax, ecx
; Udefined		call	f_prntabs
; Udefined		call	libasm_hex_32b
; Udefined		call	f_prnhex
; Udefined		call	f_prnksp
; Udefined		mov	eax, edx
; Udefined		call	f_prntabs
; Udefined		call	libasm_hex_32b
; Udefined		call	f_prnhex
; Udefined		call	f_prnksp
; Udefined	;	POP_FL				; .!.
; Udefined		pop	R_PAX
; Udefined		pop	R_PBX
; Udefined		pop	R_PCX
; Udefined		pop	R_PDX
; Udefined		ret
; ------------- ---- ------
; function:	f_prn0fh0
; rem:		print BLOCK 0fh0
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn0fh0:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	mov	R_PAX, d_0fh0
	call	f_prnmsg
;	mov	ecx, 0			; .!.
	xor	ecx, ecx
	mov	eax, 0fh
	cpuid
	bt	edx, 1
	jnc	.f_prn0fh0_01
;	nop				; .0fh0.EAX.0031.Reserved
	call	f_prntabs		; .0fh0.EBX.0031
	mov	eax, ebx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_0fh0ebx0031
	call	f_prnmsg
;	nop				; .0fh0.ECX.0031.Reserved
;	nop				; .0fh0.EDX.00.Reserved
	bt	edx, 1			; .0fh0.EDX.01
	jnc	.f_prn0fh0_00
	mov	R_PAX, d_0fh0edx01
	call	f_prnmsg
.f_prn0fh0_00:
;	nop				; .0fh0.EDX.0231.Reserved
.f_prn0fh0_01:
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn0fh1
; rem:		print BLOCK 0fh1
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn0fh1:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	mov	R_PAX, d_0fh1
	call	f_prnmsg
	mov	ecx, 1
	mov	eax, 0fh
	cpuid
;	nop				; .0fh1.EAX.0031.Reserved
	call	f_prntabs		; .0fh1.EBX.0031
	mov	eax, ebx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_0fh1ebx0031
	call	f_prnmsg
	call	f_prntabs		; .0fh1.ECX.0031
	mov	eax, ebx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_0fh1ecx0031
	call	f_prnmsg
	call	f_prnsep		; .0fh1.EDX.0031
	mov	R_PAX, d_0fh1edx
	mov	ebx, edx
	call	f_prn32bit
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn10h0
; rem:		print BLOCK 10h0
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn10h0:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	mov	R_PAX, d_10h0
	call	f_prnmsg
;	mov	ecx, 0			; .!.
	xor	ecx, ecx
	mov	eax, 10h
	cpuid
	bt	ebx, 1
	jnc	.f_prn10h0_00
;	nop				; .10h0.EAX.0031.Reserved
	call	f_prnsep		; .10h0.EBX.0031
	mov	R_PAX, d_10h0ebx
;	mov	ebx, ebx		; .!.
	call	f_prn32bit
;	nop				; .10h0.ECX.Reserved
;	nop				; .10h0.EDX.Reserved
.f_prn10h0_00:
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn10h1
; rem:		print BLOCK 10h1
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn10h1:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	mov	R_PAX, d_10h1
	call	f_prnmsg
	mov	ecx, 1
	mov	eax, 10h
	cpuid
	call	f_prntabs		; .10h1.EAX.0004
	and	eax, 1fh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_10h1eax0004
	call	f_prnmsg
;	nop				; .10h1.EAX.0531.Reserved
	call	f_prntabs		; .10h1.EBX.0031
	mov	eax, ebx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_10h1ebx0031
	call	f_prnmsg
;	nop				; .10h1.ECX.0001.Reserved
	bt	ecx, 2
	jnc	.f_prn10h1_00
	mov	R_PAX, d_10h1ecx02
	call	f_prnmsg
.f_prn10h1_00:
;	nop				; .10h1.ECX.0331.Reserved
	call	f_prntabs		; .10h1.EDX.0015
	mov	eax, edx
;	and	eax, 0ffffh		; .!.
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_10h1edx0015
	call	f_prnmsg
;	nop				; .10h1.EDX.1631.Reserved
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn10h2
; rem:		print BLOCK 10h2
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn10h2:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	mov	R_PAX, d_10h2
	call	f_prnmsg
	mov	ecx, 2
	mov	eax, 10h
	cpuid
	call	f_prntabs		; .10h2.EAX.0004
	and	eax, 1fh
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_10h2eax0004
	call	f_prnmsg
;	nop				; .10h2.EAX.0531.Reserved
	call	f_prntabs		; .10h2.EBX.0031
	mov	eax, ebx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_10h2ebx0031
	call	f_prnmsg
;	nop				; .10h2.ECX.0031.Reserved
	call	f_prntabs		; .10h2.EDX.0015
	mov	eax, edx
;	and	eax, 0ffffh		; .!.
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_10h2edx0015
	call	f_prnmsg
;	nop				; .10h2.EDX.1631.Reserved
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn10h3
; rem:		print BLOCK 10h3
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn10h3:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	mov	R_PAX, d_10h3
	call	f_prnmsg
	mov	ecx, 3
	mov	eax, 10h
	cpuid
	call	f_prntabs		; .10h3.EAX.0011
;)	and	eax, 0fffh
	call	libasm_hex_12b
	call	f_prnhex
	mov	R_PAX, d_10h3eax0011
	call	f_prnmsg
;	nop				; .10h3.EAX.1231.Reserved
;	nop				; .10h3.EBX.0031.Reserved
;	nop				; .10h3.ECX.0001.Reserved
	bt	ecx, 2
	jnc	.f_prn10h3_00
	mov	R_PAX, d_10h3ecx02
	call	f_prnmsg
.f_prn10h3_00:
;	nop				; .10h3.ECX.0331.reserved
	call	f_prntabs		; .10h3.EDX.0015
	mov	eax, edx
;	and	eax, 0ffffh		; .!.
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_10h3edx0015
	call	f_prnmsg
;	nop				; .10h3.EDX.1631.Reserved
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; Undefined	; ------------- ---- ------
; Undefined	; function:	f_prn11h
; Undefined	; rem:		print BLOCK 11h
; Undefined	; date:		2018-06-18
; Undefined	; in:
; Undefined	; out
; Undefined	;
; Undefined	section	.data
; Undefined	section	.bss
; Undefined	section	.text
; Undefined	f_prn11h:
; Undefined		push	R_PDX
; Undefined		push	R_PCX
; Undefined		push	R_PBX
; Undefined		push	R_PAX
; Undefined		PUSH_FL
; Undefined		mov	R_PAX, d_11h
; Undefined		call	f_prnmsg
; Undefined		mov	eax, 11h
; Undefined		cpuid
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined		mov	eax, ebx
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined		mov	eax, ecx
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined		mov	eax, edx
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined		POP_FL
; Undefined		pop	R_PAX
; Undefined		pop	R_PBX
; Undefined		pop	R_PCX
; Undefined		pop	R_PDX
; Undefined		ret
; ------------- ---- ------
; function:	f_prn12h0
; rem:		print BLOCK 12h0
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn12h0:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_12h0
	call	f_prnmsg
	xor	ecx, ecx
	mov	eax, 07h
	cpuid
	bt	ebx, 2			; CPUID.(EAX=07H, ECX=0H):EBX[SGX] = 1.
	mov	R_PAX, d_07hebx020
	jnc	.f_prn12h0_99
	xor	ecx, ecx
	mov	eax, 12h
	cpuid
	mov	ebp, ebx
	mov	ebx, eax		; .12h0.EAX.0031.flag32bit
	mov	R_PAX, d_12h0eax
	call	f_prn32bit
	call	f_prntabs		; .12h0.EBX.0031
	mov	eax, ebp
	call	libasm_hex_32b
	mov	R_PAX, d_12h0ebx0031
	call	f_prnmsg
;	nop				; .12h0.ECX.0031.Reserved
	call	f_prntabs		; .12h0.EDX.0007
	mov	eax, edx
;	and	eax, 0ffh		; .!.
	call	libasm_hex_08b
	mov	R_PAX, d_12h0edx0007
	call	f_prnmsg
	call	f_prntabs		; .12h0.EDX.0815
	mov	eax, edx
	shr	eax, 8
;	and	eax, 0ffh		; .!.
	call	libasm_hex_08b
	mov	R_PAX, d_12h0edx0815
;	call	f_prnmsg		; V to down
;	nop				; .12h0.EDX.1631.Reserved
.f_prn12h0_99:
	call	f_prnmsg
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn12h1
; rem:		print BLOCK 12h1
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn12h1:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_12h1
	call	f_prnmsg
	xor	ecx, ecx
	mov	eax, 07h
	cpuid
	bt	ebx, 2			; CPUID.(EAX=07H, ECX=0H):EBX[SGX] = 1.
	mov	R_PAX, d_07hebx020
	jnc	.f_prn12h1_99
	mov	ecx, 1
	mov	eax, 12h
	cpuid
	call	f_prntabs		; .12h1.EAX.0031
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_12h1eax0031
	call	f_prnmsg
	call	f_prntabs		; .12h1.EBX.0031
	mov	eax, ebx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_12h1ebx0031
	call	f_prnmsg
	call	f_prntabs		; .12h1.ECX.0031
	mov	eax, ecx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_12h1ecx0031
	call	f_prnmsg
	call	f_prntabs		; .12h1.EDX.0031
	mov	eax, edx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_12h1edx0031
.f_prn12h1_99:
	call	f_prnmsg
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn12h2
; rem:		print BLOCK 12h2
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn12h2:
	push	R_PSI
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_12h2
	call	f_prnmsg
	xor	ecx, ecx
	mov	eax, 07h
	cpuid
	bt	ebx, 2			; CPUID.(EAX=07H, ECX=0H):EBX[SGX] = 1.
	mov	R_PAX, d_07hebx020
	jnc	.f_prn12h2_99
;!x3	mov	esi, 2
.f_prn12h2_00:
	mov	ecx, 2			;!esi
	mov	eax, 12h
	cpuid
	mov	ebp, eax
	or	eax, eax		; .12h2.EAX.0003
	jnz	.f_prn12h2_01
	or	ebx, ebx
	jnz	.f_prn12h2_01
	or	ecx, ecx
	jnz	.f_prn12h2_01
	or	edx, edx
	jnz	.f_prn12h2_01
	and	eax, 0fh
	mov	R_PAX, d_12h2eax00030
	jz	.f_prn12h2_99
.f_prn12h2_01:
	mov	eax, ebp
	and	eax, 0fh
	dec	eax
	mov	R_PAX, d_12h2eax0003x
	jnz	.f_prn12h2_99
	mov	R_PAX, d_12h2eax00031
	call	f_prnmsg
;	nop				; .12h2.EAX.0411.Reserved
	call	f_prntabs		; .12h2.EAX.1231
	mov	eax, ebp
	shr	eax, 12
;	and	eax, 0fffffh		; .!.
	call	libasm_hex_20b
	call	f_prnhex
	mov	R_PAX, d_12h2eax1231
	call	f_prnmsg
	call	f_prntabs		; .12h2.EBX.0019
	mov	eax, ebx
;	and	eax, 0fffffh		; .!.
	call	libasm_hex_20b
	call	f_prnhex
	mov	R_PAX, d_12h2ebx0019
	call	f_prnmsg
;	nop				; .12h2.EBX.2031.Reserved
	mov	ebx, ecx
	and	ebx, 0fh
	mov	R_PAX, d_12h2ecx00031
	dec	ebx
	jz	.f_prn12h2_02
	inc	ebx
	mov	R_PAX, d_12h2ecx0003x
	jnz	.f_prn12h2_02
	xor	ecx, ecx
	xor	edx, edx
	mov	R_PAX, d_12h2ecx00030
.f_prn12h2_02:
	call	f_prnmsg
;	nop				; .12h2.ECX.0411.Reserved
	call	f_prntabs		; .12h2.ECX.1231
	mov	eax, ecx
	shr	eax, 12
;	and	eax, 0fffffh		; .!.
	call	libasm_hex_20b
	call	f_prnhex
	mov	R_PAX, d_12h2ecx1231
	call	f_prnmsg
	call	f_prntabs		; .12h2.EDX.0019
	mov	eax, edx
;	and	eax, 0fffffh		; .!.
	call	libasm_hex_20b
	call	f_prnhex
	mov	R_PAX, d_12h2edx0019
;	call	f_prnmsg		; V to down
;	nop				; .12h2.EDX.2031.Reserveda
;!x3	esi
.f_prn12h2_99:
	call	f_prnmsg
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	pop	R_PSI
	ret
; Undefined	; ------------- ---- ------
; Undefined	; function:	f_prn13h
; Undefined	; rem:		print BLOCK 13h
; Undefined	; date:		2018-06-18
; Undefined	; in:
; Undefined	; out
; Undefined	;
; Undefined	section	.data
; Undefined	section	.bss
; Undefined	section	.text
; Undefined	f_prn13h:
; Undefined		push	R_PDX
; Undefined		push	R_PCX
; Undefined		push	R_PBX
; Undefined		push	R_PAX
; Undefined		PUSH_FL
; Undefined		mov	R_PAX, d_13h
; Undefined		call	f_prnmsg
; Undefined		mov	eax, 13h
; Undefined		cpuid
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined		mov	eax, ebx
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined		mov	eax, ecx
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined		mov	eax, edx
; Undefined		call	f_prntabs
; Undefined		call	libasm_hex_32b
; Undefined		call	f_prnhex
; Undefined		call	f_prnksp
; Undefined		POP_FL
; Undefined		pop	R_PAX
; Undefined		pop	R_PBX
; Undefined		pop	R_PCX
; Undefined		pop	R_PDX
; Undefined		ret
; ------------- ---- ------
; function:	f_prn14h0
; rem:		print BLOCK 14h0
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn14h0:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	mov	R_PAX, d_14h0
	call	f_prnmsg
	xor	ecx, ecx
	mov	eax, 14h
	cpuid
	call	f_prntabs		; .14h0.EAX.0031
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_14h0eax0031
	call	f_prnmsg
	mov	R_PAX, d_14h0ebx	; .14h0.EBX.0031.flag32bit
	call	f_prn32bit
	mov	R_PAX, d_14h0ecx	; .14h0.ECX.0031.flag32bit
	mov	ebx, ecx
	call	f_prn32bit
;	nop				; .14h0.EDX.0031.Reserved
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn14h1
; rem:		print BLOCK 14h1
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn14h1:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_14h1
	call	f_prnmsg
	mov	ecx, 1
	mov	eax, 14h
	cpuid
	mov	ebp, eax
	call	f_prntabs		; .14h1.EAX.0002
	and	eax, 07h
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_14h1eax0002
	call	f_prnmsg
;	nop				; .14h1.EAX.0315.Reserved
	call	f_prntabs		; .14h1.EAX.1631
	mov	eax, ebp
	shr	eax, 16
;	and	eax, 0ffffh		; .!.
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_14h1eax1631
	call	f_prnmsg
	call	f_prntabs		; .14h1.EBX.0015
	mov	eax, ebx
;	and	eax, 0ffffh		; .!.
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_14h1ebx0015
	call	f_prnmsg
	call	f_prntabs		; .14h1.EBX.1631
	mov	eax, ebx
	shr	eax, 16
;	and	eax, 0ffffh		; .!.
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_14h1ebx1631
	call	f_prnmsg
;	nop				; .14h1.ECX.0031.Reserved
;	nop				; .14h1.EDX.0031.Reserved
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn15h
; rem:		print BLOCK 15h
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn15h:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	mov	R_PAX, d_15h
	call	f_prnmsg
	mov	eax, 15h
	cpuid
	call	f_prntabs		; .15h.EAX.0031
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_15heax0031
	call	f_prnmsg
	call	f_prntabs		; .15h.EBX.0031
	mov	eax, ebx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_15hebx0031
	call	f_prnmsg
	call	f_prntabs		; .15h.ECX.0031
	mov	eax, ecx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_15hecx0031
	call	f_prnmsg
;	nop				; .15h.EDX.0031.Reserved
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn16h
; rem:		print BLOCK 16h
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn16h:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	mov	R_PAX, d_16h
	call	f_prnmsg
	mov	eax, 16h
	cpuid
	call	f_prntabs		; .16h.EAX.0015
;	and	eax, 0ffffh		; .!.
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_16heax0015
	call	f_prnmsg
;	nop				; .16h.EAX.1631.Reserved
	call	f_prntabs		; .16h.EBX.0015
	mov	eax, ebx
;	and	eax, 0ffffh		; .!.
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_16hebx0015
	call	f_prnmsg
;	nop				; .16h.EBX.1631.Reserved
	call	f_prntabs		; .16h.ECX.0015
	mov	eax, ecx
;	and	eax, 0ffffh		; .!.
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_16hecx0015
	call	f_prnmsg
;	nop				; .16h.ECX.1631.Reserved
;	nop				; .16h.EDX.0031.Reserved
	mov	R_PAX, d_16hn
	call	f_prnmsg
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn17h0
; rem:		print BLOCK 17h0
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn17h0:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	mov	R_PAX, d_17h0
	call	f_prnmsg
	xor	ecx, ecx		; 0
	mov	eax, 17h
	cpuid
	call	f_prntabs		; .17h0.EAX.0031
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_17h0eax0031
	call	f_prnmsg
	call	f_prntabs		; .17h0.EBX.0015
	mov	eax, ebx
;	and	eax, 0ffffh		; .!.
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_17h0ebx0015
	call	f_prnmsg
	bt	ebx, 16			; .17h0.EBX.16
	jnc	.f_prn17h0_00
	mov	R_PAX, d_17h0ebx16
	call	f_prnmsg
.f_prn17h0_00:
;	nop				; .17h0.EBX.1731.Reserved
	call	f_prntabs		; .17h0.ECX.0031
	mov	eax, ecx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_17h0ecx0031
	call	f_prnmsg
	call	f_prntabs		; .17h0.EDX.0031
	mov	eax, edx
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_17h0edx0031
	call	f_prnmsg
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn17h1
; rem:		print BLOCK 17h1
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn17h1:
	push	R_PSI
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	mov	R_PAX, d_17h1
	call	f_prnmsg
	mov	ecx, 0
	mov	eax, 17h
	cpuid
	dec	eax
	jz	.f_prn17h1_99
	mov	esi, 1
.f_prn17h1_00:
	mov	ecx, esi
	mov	eax, 17h
	cpuid
; need UTF-8 {
	call	f_prntabs
	call	libasm_hex_32b
	call	f_prnhex
	call	f_prnksp
	mov	eax, ebx
	call	f_prntabs
	call	libasm_hex_32b
	call	f_prnhex
	call	f_prnksp
	mov	eax, ecx
	call	f_prntabs
	call	libasm_hex_32b
	call	f_prnhex
	call	f_prnksp
	mov	eax, edx
	call	f_prntabs
	call	libasm_hex_32b
	call	f_prnhex
	call	f_prnksp
; } need UTF-8
	inc	esi
	cmp	esi, 4
	jnz	.f_prn17h1_00
.f_prn17h1_99:
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	pop	R_PSI
	ret
; Reserved	; ------------- ---- ------
; Reserved	; function:	f_prn17h4
; Reserved	; rem:		print BLOCK 17h4
; Reserved	; date:		2018-06-18
; Reserved	; in:
; Reserved	; out
; Reserved	;
; Reserved	section	.data
; Reserved	section	.bss
; Reserved	section	.text
; Reserved	f_prn17h4:
; Reserved		push	R_PSI
; Reserved		push	R_PDX
; Reserved		push	R_PCX
; Reserved		push	R_PBX
; Reserved		push	R_PAX
; Reserved		PUSH_FL
; Reserved		mov	R_PAX, d_17h4
; Reserved		call	f_prnmsg
; Reserved		mov	esi, 4
; Reserved	.f_prn17h4_00:
; Reserved		mov	ecx, esi
; Reserved		mov	eax, 17h
; Reserved		cpuid
; Reserved	; need UTF-8 {
; Reserved		call	f_prntabs
; Reserved		call	libasm_hex_32b
; Reserved		call	f_prnhex
; Reserved		call	f_prnksp
; Reserved		mov	eax, ebx
; Reserved		call	f_prntabs
; Reserved		call	libasm_hex_32b
; Reserved		call	f_prnhex
; Reserved		call	f_prnksp
; Reserved		mov	eax, ecx
; Reserved		call	f_prntabs
; Reserved		call	libasm_hex_32b
; Reserved		call	f_prnhex
; Reserved		call	f_prnksp
; Reserved		mov	eax, edx
; Reserved		call	f_prntabs
; Reserved		call	libasm_hex_32b
; Reserved		call	f_prnhex
; Reserved		call	f_prnksp
; Reserved	; } need UTF-8
; Reserved		inc	R_PSI
; Reserved		cmp	R_PSI, 5
; Reserved		jnz	.f_prn17h4_00
; Reserved		POP_FL
; Reserved		pop	R_PAX
; Reserved		pop	R_PBX
; Reserved		pop	R_PCX
; Reserved		pop	R_PDX
; Reserved		pop	R_PSI
; Reserved		ret
; ------------- ---- ------
; function:	f_prn18h
; rem:		print BLOCK 18h
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn18h:
	push	R_PDI
	push	R_PSI
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_18h0
	call	f_prnmsg
	xor	esi, esi
.f_prn18h_00:
	mov	ecx, esi
	mov	eax, 18h
	cpuid
	mov	ebp, edx
	and	ebp, 1fh
	jz	.f_prn18h_99
	or	eax, eax
	jnz	.f_prn18h_01
	or	ebx, ebx
	jnz	.f_prn18h_01
	or	ecx, ecx
	jnz	.f_prn18h_01
	or	edx, edx
	jz	.f_prn18h_99
.f_prn18h_01:
	or	esi, esi
	jnz	.f_prn18h_02
	mov	edi, eax		; ecx == 0
	call	f_prntabs		; .18h0.EAX.0031
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_18h0eax0031
	call	f_prnmsg
.f_prn18h_02:
	cmp	esi, 1
	jnz	.f_prn18h_03
	mov	R_PAX, d_18h1		; ecx == 1
	call	f_prnmsg
.f_prn18h_03:
;	nop				; .18h0.EAX.0031.Reserved
	bt	ebx, 0			; .18h0.EBX.00
	jnc	.f_prn18h_04
	mov	R_PAX, d_18h0ebx00
	call	f_prnmsg
.f_prn18h_04:
	bt	ebx, 1			; .18h0.EBX.01
	jnc	.f_prn18h_05
	mov	R_PAX, d_18h0ebx01
	call	f_prnmsg
.f_prn18h_05:
	bt	ebx, 2			; .18h0.EBX.02
	jnc	.f_prn18h_06
	mov	R_PAX, d_18h0ebx02
	call	f_prnmsg
.f_prn18h_06:
	bt	ebx, 3			; .18h0.EBX.03
	jnc	.f_prn18h_07
	mov	R_PAX, d_18h0ebx03
	call	f_prnmsg
.f_prn18h_07:
;	nop				; .18h0.EBX.0417.Reserved
	call	f_prntabs		; .18h0.EBX.0810
	mov	eax, ebx
	shr	eax, 8
	and	eax, 07h
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_18h0ebx0810
	call	f_prnmsg
;	nop				; .18h0.EBX.1115.Reserved
	call	f_prntabs		; .18h0.EBX.1631
	mov	eax, ebx
	shr	eax, 16
;	and	eax, 0ffffh		; .!.
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_18h0ebx1631
	call	f_prnmsg
	call	f_prntabs		; .18h0.ECX.0031
	mov	eax, ecx
	call	libasm_hex_32b
	mov	R_PAX, d_18h0ecx0031
	call	f_prnmsg
	call	f_prntabs		; .18h0.EDX.0004
	mov	eax, edx
	and	eax, 1fh
	call	libasm_hex_08b
	mov	R_PBX, d_18h0edx00040
;	or	eax, eax		; .!.
	jz	.f_prn18h_08
	mov	R_PBX, d_18h0edx00041
	dec	eax
	jz	.f_prn18h_08
	mov	R_PBX, d_18h0edx00042
	dec	eax
	jz	.f_prn18h_08
	mov	R_PBX, d_18h0edx00043
	dec	eax
	jz	.f_prn18h_08
	mov	R_PBX, d_18h0edx0004x
.f_prn18h_08:
	mov	R_PAX, R_PBX
	call	f_prnmsg
	call	f_prntabs		; .18h0.EDX.0507
	mov	eax, edx
	shr	eax, 5
	and	eax, 07h
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_18h0edx0507
	call	f_prnmsg
	bt	edx, 8			; .18h0.EDX.08
	jnc	.f_prn18h_09
	mov	R_PAX, d_18h0edx08
	call	f_prnmsg
.f_prn18h_09:
;	nop				; .18h0.EDX.0913
	call	f_prntabs		; .18h0.EDX.1425
	mov	eax, edx
	shr	eax, 14
	and	eax, 0fffh
	inc	eax			; **Add one to the return value to get the result.
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_18h0edx1425
	call	f_prnmsg
;	nop				; .18h0.EDX.2631.Reserved
	inc	esi
	cmp	esi, edi
	jbe	.f_prn18h_00
.f_prn18h_99:
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	pop	R_PSI
	pop	R_PDI
	ret
; off	GPLv3+:				; GPLv3+ {
	db	"DavydovMA GPLv3+"	; } GPLv3+
; ------------- ---- ------
; function:	f_prn80h
; rem:		print BLOCK 80000000h
; date:		2019-02-21
; in:
; out
;	ECX	: Maximum Input Value for Extended Function CPUID Information
;
section	.data
section	.bss
section	.text
f_prn80h:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
;?	push	R_PBP
	mov	eax, 80000000h
	cpuid
	mov	ecx, eax		; Maximum Input Value for Extended Function CPUID Information
	call	f_prntabs		; .80h.EAX.0031
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_80heax0031
	call	f_prnmsg
;	nop				; .80h.EBX.0031.Reserved
;	nop				; .80h.ECX.0031.Reserved
;	nop				; .80h.EDX.0031.Reserved
;?	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
;	pop	R_PCX			; Maximum Input Value for Extended Function CPUID Information
	pop	R_PDX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn81h
; rem:		print BLOCK 80000001h
; date:		2019-02-21
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn81h:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	mov	eax, 80000001h
	cpuid
	call	f_prntabs		; .81h.EAX.0031
	call	libasm_hex_32b
	call	f_prnhex
	mov	R_PAX, d_81heax0031
	call	f_prnmsg
;	nop				; .81h.EBX.Reserved
	mov	R_PAX, d_81hecx		; .81h.ECX.0031.32bits
	mov	ebx, ecx
	call	f_prn32bit
	mov	R_PAX, d_81hedx		; .81h.EDX.0031.32bits
	mov	ebx, edx
	call	f_prn32bit
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn82h
; rem:		print BLOCK 80000002h
; date:		2020-01-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn82h:
	push	R_PDI
	push 	R_PSI
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PBP, R_PSP
	call	f_prntabs
	mov	eax, 80000000h
	cpuid
	mov	edi, 80000002h
f_prn82h_88:
	cmp	eax, edi
	jb	.f_prn82h_99
	mov	esi, eax
	mov	eax, edi
	cpuid
%ifdef	x86_32				; x86_32 {
	push	R_PDX			; .82h.EDX.0031
	push	R_PCX			; .82h.ECX.0031
	push	R_PBX			; .82h.EBX.0031
	push	R_PAX			; .82h.EAX.0031
%endif					; } x86_32
%ifdef	x86_64				; x86_64 {
	rol	R_PDX, 32
	or	R_PCX, R_PDX
	push	R_PCX
	rol	R_PBX, 32
	or	R_PAX, R_PBX
	push	R_PAX
%endif					; } x86_64
;?	mov	ebx, esi
	mov	R_PSI, R_PSP
	mov	R_PCX, 16
	cld
.f_prn82h_00:
	lodsb
	call	libasm_prn_ascii
	loop	.f_prn82h_00
	mov	R_PAX, d_82h84h
	call	f_prnmsg
.f_prn82h_99:
	mov	R_PSP, R_PBP
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	pop	R_PSI
	pop	R_PDI
	ret
; ------------- ---- ------
; function:	f_prn83h
; rem:		print BLOCK 80000003h
; date:		2019-02-21
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn83h:
	push	R_PDI
	push 	R_PSI
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PBP, R_PSP
	call	f_prntabs
	mov	eax, 80000000h
	cpuid
	mov	edi, 80000003h
	jmp	f_prn82h_88
; ------------- ---- ------
; function:	f_prn84h
; rem:		print BLOCK 80000004h
; date:		2019-02-21
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn84h:
	push	R_PDI
	push 	R_PSI
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PBP, R_PSP
	call	f_prntabs
	mov	eax, 80000000h
	cpuid
	mov	edi, 80000004h
	jmp	f_prn82h_88
; Reserved	; ------------- ---- ------
; Reserved	; function:	f_prn85h
; Reserved	; rem:		print BLOCK 80000005h
; Reserved	; date:		2018-06-18
; Reserved	; in:
; Reserved	; out
; Reserved	;
; Reserved	section	.data
; Reserved	section	.bss
; Reserved	section	.text
; Reserved	f_prn85h:
; Reserved		push	R_PDX
; Reserved		push	R_PCX
; Reserved		push	R_PBX
; Reserved		push	R_PAX
; Reserved		PUSH_FL
; Reserved		mov	R_PAX, d_85h
; Reserved		call	f_prnmsg
; Reserved		mov	eax, 80000005h
; Reserved		cpuid
; Reserved		call	f_prntabs
; Reserved		call	libasm_hex_32b
; Reserved		call	f_prnhex
; Reserved		call	f_prnksp
; Reserved		mov	eax, ebx
; Reserved		call	f_prntabs
; Reserved		call	libasm_hex_32b
; Reserved		call	f_prnhex
; Reserved		call	f_prnksp
; Reserved		mov	eax, ecx
; Reserved		call	f_prntabs
; Reserved		call	libasm_hex_32b
; Reserved		call	f_prnhex
; Reserved		call	f_prnksp
; Reserved		mov	eax, edx
; Reserved		call	f_prntabs
; Reserved		call	libasm_hex_32b
; Reserved		call	f_prnhex
; Reserved		call	f_prnksp
; Reserved		POP_FL
; Reserved		pop	R_PAX
; Reserved		pop	R_PBX
; Reserved		pop	R_PCX
; Reserved		pop	R_PDX
; Reserved		ret
; ------------- ---- ------
; function:	f_prn86h
; rem:		print BLOCK 80000006h
; date:		2019-02-21
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn86h:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	eax, 80000000h
	cpuid
	mov	ebp, 80000006h
	cmp	eax, ebp
	jb	.f_prn86h_99
	mov	eax, ebp
	cpuid
;	nop				; .86h.EAX.0031.Reserved
;	nop				; .86h.EBX.0031.Reserved
	call	f_prntabs		; .86h.ECX.0007
	mov	eax, ecx
	and	eax, 0ffh		; .!.
	mov	ebp, eax
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_86hecx0007
	call	f_prnmsg
	mov	eax, ebp
	call	f_prntabs
	call	f_prndec
	call	f_prnksp
;	nop				; .86h.ECX.0811.Reserved
	call	f_prntabs		; .86h.ECX.1215
	mov	eax, ecx
	shr	eax, 12
;	and	eax, 0fh		; .!.
	call	libasm_hex_04b
	call	f_prnhex
	mov	R_PAX, d_86hecx1215
	call	f_prnmsg
	call	f_prntabs		; .86h.ECX.1631
	mov	eax, ecx
	shr	eax, 16
	and	eax, 0ffffh		; .!.
	mov	ebp, eax
	call	libasm_hex_16b
	call	f_prnhex
	mov	R_PAX, d_86hecx1631
	call	f_prnmsg
	mov	eax, ebp
	call	f_prntabs
	call	f_prndec
	call	f_prnksp
;	nop				; .86h.EDX.0031.Reserved
.f_prn86h_99:
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn87h
; rem:		print BLOCK 80000007h
; date:		2019-02-21
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn87h:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	eax, 80000000h
	cpuid
	mov	ebp, 80000007h
	cmp	eax, ebp
	jb	.f_prn87h_99
	mov	eax, ebp
	cpuid
;	nop				; .87h.EAX.0031.Reserved
;	nop				; .87h.EBX.0031.Reserved
;	nop				; .87h.ECX.0031.Reserved
	mov	R_PAX, d_87hedx		; .87h.EDX.0031
	mov	ebx, edx
	call	f_prn32bit
.f_prn87h_99:
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; ------------- ---- ------
; function:	f_prn88h
; rem:		print BLOCK 80000008h
; date:		2019-02-21
; in:
; out
;
section	.data
section	.bss
section	.text
f_prn88h:
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	eax, 80000000h
	cpuid
	mov	ebp, 80000008h
	cmp	eax, ebp
	jb	.f_prn88h_99
	mov	eax, ebp
	cpuid
	mov	ebp, eax
	call	f_prntabs		; .88h.EAX.0007
;	and	eax, 0ffh		; .!.
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_88heax0007
	call	f_prnmsg
	call	f_prntabs
	mov	eax, ebp
	and	eax, 0ffh
	call	f_prndec
	call	f_prnksp
	call	f_prntabs		; .88h.EAX.0815
	mov	eax, ebp
	shr	eax, 8
	mov	ebp, eax
;	and	eax, 0ffh		; .!.
	call	libasm_hex_08b
	call	f_prnhex
	mov	R_PAX, d_88heax0815
	call	f_prnmsg
	call	f_prntabs
	mov	eax, ebp
	and	eax, 0ffh
	call	f_prndec
	call	f_prnksp
;	nop				; .87h.EAX.1631.Reserved
;	nop				; .88h.EBX.0031.Reserved
;	nop				; .88h.ECX.0031.Reserved
;	nop				; .88h.EDX.0031.Reserved
.f_prn88h_99:
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	ret
; off	GPLv3+:				; GPLv3+ {
	db	"DavydovMA GPLv3+"	; } GPLv3+
; ------------- ---- ------
; function:	f_ext00
; rem:		print EXTENDED 00
; date:		2018-06-18
; in:
; out
;
section	.data
section	.bss
section	.text
f_ext00:
	push	R_PDI
	push	R_PSI
	push	R_PDX
	push	R_PCX
	push	R_PBX
	push	R_PAX
	PUSH_FL
	push	R_PBP
	mov	R_PAX, d_ext00		; .ext00
	call	f_prnmsg
	mov	eax, 01h
	cpuid
	call	f_prntabs		; F-M-S
	xor	ebx, ebx
	xor	ecx, ecx
	mov	ebp, eax
	shr	eax, 8			; F
	and	eax, 0fh
	mov	esi, eax
	cmp	eax, 0fh
	jnz	.f_ext00_00
	mov	eax, ebp
	shr	eax, 20
	and	eax, 0ffh
	add	eax, esi
.f_ext00_00:
	mov	bh, al			; BH <- F
	mov	eax, ebp		; M
	shr	eax, 4
	and	eax, 0fh
	cmp	esi, 0fh
	jz	.f_ext00_01
	cmp	esi, 06h
	jnz	.f_ext00_02
.f_ext00_01:
	mov	esi, ebp
	shr	esi, 16
	and	esi, 0fh
	shl	esi, 4
	add	eax, esi
.f_ext00_02:
	mov	bl, al			; BL <- M
	xor	R_PCX, R_PCX		; find index
	mov	R_PSI, d_dfdm
	cld
.f_ext00_03:
	lodsw
	cmp	ax, bx
	jz	.f_ext00_04
	or	ah, ah
	jnz	.f_ext00_03
	inc	R_PCX
	cmp	al, 0ffh
	jnz	.f_ext00_03
	dec	R_PCX
.f_ext00_04:
	mov	R_PAX, d_pf		; find message
	or	R_PCX, R_PCX
	jz	.f_ext00_07
	inc	R_PCX
	cld
	mov	R_PDI, R_PAX
	xor	al, al
.f_ext00_05:
	mov	R_PBP, R_PDI
.f_ext00_06:
	scasb
	jnz	.f_ext00_06
	loop	.f_ext00_05
	mov	R_PAX, R_PBP
.f_ext00_07:
	call	libasm_prn_ascii_msg	; print message
	call	f_prnksp
	pop	R_PBP
	POP_FL
	pop	R_PAX
	pop	R_PBX
	pop	R_PCX
	pop	R_PDX
	pop	R_PSI
	pop	R_PDI
	ret
; off	GPLv3+:				; GPLv3+ {
	db	"DavydovMA GPLv3+"	; } GPLv3+


%endif						; ASM_CPUID_INTEL_X86_XX {
; } DavydovMA 2020022100