; DavydovMA 2013040600 {
%ifndef	ASM_CPUID_INTEL_DATA		; ASM_CPUID_INTEL_DATA {
%define	ASM_CPUID_INTEL_DATA

%define	ASM_CPUID_INTEL_DATA_FILE	"cpuid_intel_data.asm"
%define	ASM_CPUID_INTEL_DATA_NAME	"cpuid_intel_data"
%define	ASM_CPUID_INTEL_DATA_VERSION	"20.01"
%define	ASM_CPUID_INTEL_DATA_COPYRIGHT	"Copyright 1990-2020"
%define	ASM_CPUID_INTEL_DATA_AUTHOR	"DavydovMA"
%define	ASM_CPUID_INTEL_DATA_URL	"http://domain"
%define	ASM_CPUID_INTEL_DATA_EMAIL	"dev-asm@domain"

section	.data

; ---------------- ---- ------
; rem:		EQU
;
%define	DISP_SET_COL	1bh,"[1;33;40m"	; 0=black,1=red,2=green,3=yellow,4=blue,5=magenta,6=cyan,7=white
%define DISP_COL_RES	1bh,"[0m"
%define	DISP_NL		0dh,0ah		; New Line
;
; ---------------- ---- ------
; block:	data {
; rem:		BLOCK DATA (Intel® 64 and IA-32 Architectures Order Number: 325383-067US May 2018)
; date:		2019-02-21
;
d_soft:			db	DISP_NL,DISP_SET_COL,SOFT_NAME," version ",SOFT_VERSION,DISP_COL_RES,", ",SOFT_COPYRIGHT,", Free Software ",SOFT_AUTHOR,", Inc",DISP_NL,"URL	:",SOFT_URL,DISP_NL,"e-mail	:",SOFT_EMAIL,DISP_NL,0
d_title:		db	"---------------- ---- ------",0
d_update:		db	"	[2018.05]	: Update",0
d_exit:			db	DISP_NL,"exit.",0
f_prntabs_00:		db	"	[",0
f_prnsep_00:		db	"	---------------- ---- ------",DISP_NL,0
d_prnmsg_00:		db	DISP_NL,9,9,9,"  ",0
d_prnmsg_01:		db	DISP_NL,0
d_prnksp_00:		db	"]"
d_prnnl_00:		db	DISP_NL,0
d_check_yes:		db	"Supported]",0
d_check_not:		db	"Not Supported]",0
d_intel_yes:		db	"Intel]",0
d_intel_not:		db	"Not Intel]",0
d_00_title:		db	"---------------- ---- ------",DISP_NL
			db	"Basic CPUID Information:",0
d_00heax0031:		db	"]	: Maximum Input Value for Basic CPUID Information.",0
d_01h:			db	"Version Information:",0
d_01heax121300:		db	"Original OEM Processor",0
d_01heax121301:		db	"Intel OverDrive Processor",0
d_01heax121310:		db	"Dual processor (not applicable to Intel486 processors)",0
d_01heax121311:		db	"Intel reserved",0
d_01heax1213:		db	"]	: Type.",0
d_01heax0407:		db	"] 		: Model.",0
d_01heax1619:		db	"] 		: Extended Model ID.",0
d_01heax0811:		db	"]		: Family ID.",0
d_01heax2027:		db	"]		: Extended Family ID.",0
d_01heax0003:		db	"]		: Stepping ID.",0
d_01heaxFMS:		db	"]	: Family-Model-Stepping",0
d_01hebx0007:		db	"]		: Brand Index.",0
d_01hebx0815:		db	"]		: CLFLUSH line size (Value ∗ 8 = cache line size in bytes; used also by CLFLUSHOPT).",0
d_01hebx1623:		db	"]		: Maximum number of addressable IDs for logical processors in this physical package. (The nearest power-of-2 integer that is not smaller than is the number of unique initial APIC IDs reserved for addressing different logical processors in a physical package. This field is only valid if [HTT] is.)",0
d_01hebx2431:		db	"]		: Initial APIC ID.",0
; FIXME ! NEED STRUCT
;	00	- ID SORT (0-256)
;	00	- AL from EAX CPUID
;	00
;	  H	- REG (1=EAX, 2=EBX, 3=ECX, 4=EDX)
;	  L	- BIT status ( 0|1 )
;	...	- Messages with 00 terminated
d_01hecxedx:			db	"Feature Information:",0
d_01hecx:		db	1,0
d_01hecx00:		db	"	[SSE3]		: Streaming SIMD Extensions 3 (SSE3).",0
d_01hecx01:		db	"	[PCLMULQDQ]	: The processor supports the PCLMULQDQ instruction.",0
d_01hecx02:		db	"	[DTES64]	: 64-bit DS Area. The processor supports DS area using 64-bit layout.",0
d_01hecx03:		db	"	[MONITOR]	: MONITOR/MWAIT. The processor supports this feature.",0
d_01hecx04:		db	"	[DS-CPL]	: CPL Qualified Debug Store. The processor supports the extensions to the Debug Store feature to allow for branch message storage qualified by CPL.",0
d_01hecx05:		db	"	[VMX]		: Virtual Machine Extensions.",0
d_01hecx06:		db	"	[SMX]		: Safer Mode Extensions.",0
d_01hecx07:		db	"	[EIST]		: Enhanced Intel SpeedStep® technology.",0
d_01hecx08:		db	"	[TM2]		: Thermal Monitor 2 technology.",0
d_01hecx09:		db	"	[SSSE3]		: The Supplemental Streaming SIMD Extensions 3 (SSSE3).",0
d_01hecx10:		db	"	[CNXT-ID]	: L1 Context ID. The L1 data cache mode can be set to either adaptive mode or shared mode.",0
d_01hecx11:		db	"	[SDBG]		: Supports IA32_DEBUG_INTERFACE MSR for silicon debug.",0
d_01hecx12:		db	"	[FMA]		: Supports FMA extensions using YMM state.",0
d_01hecx13:		db	"	[CMPXCHG16B]	: CMPXCHG16B Available.",0
d_01hecx14:		db	"	[xTPR UC]	: xTPR Update Control.",0
d_01hecx15:		db	"	[PDCM]		: Perfmon and Debug Capability: The processor supports the performance and debug feature indication MSR IA32_PERF_CAPABILITIES.",0
d_01hecx16:		db	"	[Reserved]	: Reserved.01h.ecx.16",0
d_01hecx17:		db	"	[PCID]		: Process-context identifiers. The processor supports PCIDs and that software may set CR4.PCIDE to 1.",0
d_01hecx18:		db	"	[DCA]		: The processor supports the ability to prefetch data from a memory mapped device.",0
d_01hecx19:		db	"	[SSE4.1]	: The processor supports SSE4.1.",0
d_01hecx20:		db	"	[SSE4.2]	: The processor supports SSE4.2.",0
d_01hecx21:		db	"	[x2APIC]	: The processor supports x2APIC feature.",0
d_01hecx22:		db	"	[MOVBE]		: The processor supports MOVBE instruction.",0
d_01hecx23:		db	"	[POPCNT]	: The processor supports the POPCNT instruction.",0
d_01hecx24:		db	"	[TSC-Deadline]	: The processor’s local APIC timer supports one-shot operation using a TSC deadline value.",0
d_01hecx25:		db	"	[AESNI]		: The processor supports the AESNI instruction extensions.",0
d_01hecx26:		db	"	[XSAVE]		: The processor supports the XSAVE/XRSTOR processor extended states feature, the XSETBV/XGETBV instructions, and XCR0.",0
d_01hecx27:		db	"	[OSXSAVE]	: The OS has set CR4.OSXSAVE[bit 18] to enable XSETBV/XGETBV instructions to access XCR0 and to support processor extended state management using XSAVE/XRSTOR.",0
d_01hecx28:		db	"	[AVX]		: The processor supports the AVX instruction extensions.",0
d_01hecx29:		db	"	[F16C]		: That processor supports 16-bit floating-point conversion instructions.",0
d_01hecx30:		db	"	[RDRAND]	: That processor supports RDRAND instruction.",0
d_01hecx31:		db	"	[Not Used]	: Always returns 0..01h.ecx.31",0
d_01hedx:		db	1,0
d_01hedx00:		db	"	[FPU]		: Floating Point Unit On-Chip. The processor contains an x87 FPU.",0
d_01hedx01:		db	"	[VME]		: Virtual 8086 Mode Enhancements. Virtual 8086 mode enhancements, including CR4.VME for controlling the feature, CR4.PVI for protected mode virtual interrupts, software interrupt indirection, expansion of the TSS with the software indirection bitmap, and EFLAGS.VIF and EFLAGS.VIP flags.",0
d_01hedx02:		db	"	[DE]		: Debugging Extensions. Support for I/O breakpoints, including CR4.DE for controlling the feature, and optional trapping of accesses to DR4 and DR5.",0
d_01hedx03:		db	"	[PSE]		: Page Size Extension. Large pages of size 4 MByte are supported, including CR4.PSE for controlling the feature, the defined dirty bit in PDE (Page Directory Entries), optional reserved bit trapping in CR3, PDEs, and PTEs.",0
d_01hedx04:		db	"	[TSC]		: Time Stamp Counter. The RDTSC instruction is supported, including CR4.TSD for controlling privilege.",0
d_01hedx05:		db	"	[MSR]		: Model Specific Registers RDMSR and WRMSR Instructions. The RDMSR and WRMSR instructions are supported. Some of the MSRs are implementation dependent.",0
d_01hedx06:		db	"	[PAE]		: Physical Address Extension. Physical addresses greater than 32 bits are supported: extended page table entry formats, an extra level in the page translation tables is defined, 2-MByte pages are supported instead of 4 Mbyte pages.",0
d_01hedx07:		db	"	[MCE]		: Machine Check Exception. Exception 18 is defined for Machine Checks, including CR4.MCE for controlling the feature. This feature does not define the model-specific implementations of machine-check error logging, reporting, and processor shutdowns. Machine Check exception handlers may have to depend on processor version to do model specific processing of the exception, or test for the presence of the Machine Check feature.",0
d_01hedx08:		db	"	[CX8]		: CMPXCHG8B Instruction. The compare-and-exchange 8 bytes (64 bits) instruction is supported (implicitly locked and atomic).",0
d_01hedx09:		db	"	[APIC]		: APIC On-Chip. The processor contains an Advanced Programmable Interrupt Controller (APIC), responding to memory mapped commands in the physical address range FFFE0000H to FFFE0FFFH (by default - some processors permit the APIC to be relocated).",0
d_01hedx10:		db	"	[Reserved]	: Reserved.01h.edx.10",0
d_01hedx11:		db	"	[SEP]		: SYSENTER and SYSEXIT Instructions. The SYSENTER and SYSEXIT and associated MSRs are supported.",0
d_01hedx12:		db	"	[MTRR]		: Memory Type Range Registers. MTRRs are supported. The MTRRcap MSR contains feature bits that describe what memory types are supported, how many variable MTRRs are supported, and whether fixed MTRRs are supported.",0
d_01hedx13:		db	"	[PGE]		: Page Global Bit. The global bit is supported in paging-structure entries that map a page, indicating TLB entries that are common to different processes and need not be flushed. The CR4.PGE bit controls this feature.",0
d_01hedx14:		db	"	[MCA]		: Machine Check Architecture. The Machine Check Architecture of reporting machine errors is supported. The MCG_CAP MSR contains feature bits describing how many banks of error reporting MSRs are supported.",0
d_01hedx15:		db	"	[CMOV]		: Conditional Move Instructions. The conditional move instruction CMOV is supported. In addition, if x87 FPU is present as indicated by the CPUID.FPU feature bit, then the FCOMI and FCMOV instructions are supported",0
d_01hedx16:		db	"	[PAT]		: Page Attribute Table. Page Attribute Table is supported. This feature augments the Memory Type Range Registers (MTRRs), allowing an operating system to specify attributes of memory accessed through a linear address on a 4KB granularity.",0
d_01hedx17:		db	"	[PSE-36]	: 36-Bit Page Size Extension. 4-MByte pages addressing physical memory beyond 4 GBytes are supported with 32-bit paging. This feature indicates that upper bits of the physical address of a 4-MByte page are encoded in bits 20:13 of the page-directory entry. Such physical addresses are limited by MAXPHYADDR and may be up to 40 bits in size.",0
d_01hedx18:		db	"	[PSN]		: Processor Serial Number. The processor supports the 96-bit processor identification number feature and the feature is enabled.",0
d_01hedx19:		db	"	[CLFSH]		: CLFLUSH Instruction. CLFLUSH Instruction is supported.",0
d_01hedx20:		db	"	[Reserved]	: Reserved.01h.edx.20",0
d_01hedx21:		db	"	[DS]		: Debug Store. The processor supports the ability to write debug information into a memory resident buffer. This feature is used by the branch trace store (BTS) and processor event-based sampling (PEBS) facilities.",0
d_01hedx22:		db	"	[ACPI]		: Thermal Monitor and Software Controlled Clock Facilities. The processor implements internal MSRs that allow processor temperature to be monitored and processor performance to be modulated in predefined duty cycles under software control.",0
d_01hedx23:		db	"	[MMX]		: Intel MMX Technology. The processor supports the Intel MMX technology.",0
d_01hedx24:		db	"	[FXSR]		: XSAVE and FXRSTOR Instructions. The FXSAVE and FXRSTOR instructions are supported for fast save and restore of the floating point context. Presence of this bit also indicates that CR4.OSFXSR is available for an operating system to indicate that it supports the FXSAVE and FXRSTOR instructions.",0
d_01hedx25:		db	"	[SSE]		: SSE. The processor supports the SSE extensions.",0
d_01hedx26:		db	"	[SSE2]		: SSE2. The processor supports the SSE2 extensions.",0
d_01hedx27:		db	"	[SS]		: Self Snoop. The processor supports the management of conflicting memory types by performing a snoop of its own cache structure for transactions issued to the bus.",0
d_01hedx281:		db	"	[HTT]		: Max APIC IDs reserved field is Valid. For HTT indicates the value in CPUID.1.EBX[23:16] (the Maximum number of addressable IDs for logical processors in this package) is valid for the package.",0
d_01hedx29:		db	"	[TM]		: Thermal Monitor. The processor implements the thermal monitor automatic thermal control circuitry (TCC).",0
d_01hedx30:		db	"	[Reserved]	: Reserved.01h.edx.30",0
d_01hedx31:		db	"	[PBE]		: Pending Break Enable. The processor supports the use of the FERR#/PBE# pin when the processor is in the stop-clock state (STPCLK# is asserted) to signal the processor that an interrupt is pending and that the processor should return to normal operation to handle the interrupt. Bit 10 (PBE enable) in the IA32_MISC_ENABLE MSR enables this capability.",0
d_01hedx280:		db	"	[HTT]		: Max APIC IDs reserved field is Valid. For HTT indicates there is only a single logical processor in the package and software should assume only a single APIC ID is reserved.",0
d_02h:			db	"Cache and TLB Information:",0
d_02h00:		db	"	[General]	: Null descriptor, this byte contains no information.",0
d_02h01:		db	"	[TLB]		: Instruction TLB: 4 KByte pages, 4-way set associative, 32 entries.",0
d_02h02:		db	"	[TLB]		: Instruction TLB: 4 MByte pages, fully associative, 2 entries.",0
d_02h03:		db	"	[TLB]		: Data TLB: 4 KByte pages, 4-way set associative, 64 entries.",0
d_02h04:		db	"	[TLB]		: Data TLB: 4 MByte pages, 4-way set associative, 8 entries.",0
d_02h05:		db	"	[TLB]		: Data TLB1: 4 MByte pages, 4-way set associative, 32 entries.",0
d_02h06:		db	"	[Cache]		: 1st-level instruction cache: 8 KBytes, 4-way set associative, 32 byte line size.",0
d_02h07:		db	"	[-]		: Reserved.02h.07h.",0
d_02h08:		db	"	[Cache]		: 1st-level instruction cache: 16 KBytes, 4-way set associative, 32 byte line size.",0
d_02h09:		db	"	[Cache]		: 1st-level instruction cache: 32KBytes, 4-way set associative, 64 byte line size.",0
d_02h0a:		db	"	[Cache]		: 1st-level data cache: 8 KBytes, 2-way set associative, 32 byte line size.",0
d_02h0b:		db	"	[TLB]		: Instruction TLB: 4 MByte pages, 4-way set associative, 4 entries.",0
d_02h0c:		db	"	[Cache]		: 1st-level data cache: 16 KBytes, 4-way set associative, 32 byte line size.",0
d_02h0d:		db	"	[Cache]		: 1st-level data cache: 16 KBytes, 4-way set associative, 64 byte line size.",0
d_02h0e:		db	"	[Cache]		: 1st-level data cache: 24 KBytes, 6-way set associative, 64 byte line size.",0
d_02h0f:		db	"	[-]		: Reserved.02h.0fh.",0
d_02h10:		db	"	[-]		: Reserved.02h.10.",0
d_02h11:		db	"	[-]		: Reserved.02h.11.",0
d_02h12:		db	"	[-]		: Reserved.02h.12.",0
d_02h13:		db	"	[-]		: Reserved.02h.13.",0
d_02h14:		db	"	[-]		: Reserved.02h.14.",0
d_02h15:		db	"	[-]		: Reserved.02h.15.",0
d_02h16:		db	"	[-]		: Reserved.02h.16.",0
d_02h17:		db	"	[-]		: Reserved.02h.17.",0
d_02h18:		db	"	[-]		: Reserved.02h.18.",0
d_02h19:		db	"	[-]		: Reserved.02h.19.",0
d_02h1a:		db	"	[-]		: Reserved.02h.1a.",0
d_02h1b:		db	"	[-]		: Reserved.02h.1b.",0
d_02h1c:		db	"	[-]		: Reserved.02h.1c.",0
d_02h1d:		db	"	[Cache]		: 2nd-level cache: 128 KBytes, 2-way set associative, 64 byte line size.",0
d_02h1e:		db	"	[-]		: Reserved.02h.1e.",0
d_02h1f:		db	"	[-]		: Reserved.02h.1f.",0
d_02h20:		db	"	[-]		: Reserved.02h.20.",0
d_02h21:		db	"	[Cache]		: 2nd-level cache: 256 KBytes, 8-way set associative, 64 byte line size.",0
d_02h22:		db	"	[Cache]		: 3rd-level cache: 512 KBytes, 4-way set associative, 64 byte line size, 2 lines per sector.",0
d_02h23:		db	"	[Cache]		: 3rd-level cache: 1 MBytes, 8-way set associative, 64 byte line size, 2 lines per sector.",0
d_02h24:		db	"	[Cache]		: 2nd-level cache: 1 MBytes, 16-way set associative, 64 byte line size.",0
d_02h25:		db	"	[Cache]		: 3rd-level cache: 2 MBytes, 8-way set associative, 64 byte line size, 2 lines per sector.",0
d_02h26:		db	"	[-]		: Reserved.02h.26.",0
d_02h27:		db	"	[-]		: Reserved.02h.27.",0
d_02h28:		db	"	[-]		: Reserved.02h.28.",0
d_02h29:		db	"	[Cache]		: 3rd-level cache: 4 MBytes, 8-way set associative, 64 byte line size, 2 lines per sector.",0
d_02h2a:		db	"	[-]		: Reserved.02h.2a.",0
d_02h2b:		db	"	[Cache]		: 1st-level data cache: 32 KBytes, 8-way set associative, 64 byte line size.",0
d_02h2c:		db	"	[-]		: Reserved.02h.2c.",0
d_02h2d:		db	"	[-]		: Reserved.02h.2d.",0
d_02h2e:		db	"	[-]		: Reserved.02h.2e.",0
d_02h2f:		db	"	[-]		: Reserved.02h.2f.",0
d_02h30:		db	"	[Cache]		: 1st-level instruction cache: 32 KBytes, 8-way set associative, 64 byte line size.",0
d_02h31:		db	"	[-]		: Reserved.02h.31.",0
d_02h32:		db	"	[-]		: Reserved.02h.32.",0
d_02h33:		db	"	[-]		: Reserved.02h.33.",0
d_02h34:		db	"	[-]		: Reserved.02h.34.",0
d_02h35:		db	"	[-]		: Reserved.02h.35.",0
d_02h36:		db	"	[-]		: Reserved.02h.36.",0
d_02h37:		db	"	[-]		: Reserved.02h.37.",0
d_02h38:		db	"	[-]		: Reserved.02h.38.",0
d_02h39:		db	"	[-]		: Reserved.02h.39.",0
d_02h3a:		db	"	[-]		: Reserved.02h.3a.",0
d_02h3b:		db	"	[-]		: Reserved.02h.3b.",0
d_02h3c:		db	"	[-]		: Reserved.02h.3c.",0
d_02h3d:		db	"	[-]		: Reserved.02h.3d.",0
d_02h3e:		db	"	[-]		: Reserved.02h.3e.",0
d_02h3f:		db	"	[-]		: Reserved.02h.3f.",0
d_02h40:		db	"	[Cache]		: No 2nd-level cache or, if processor contains a valid 2nd-level cache, no 3rd-level cache.",0
d_02h41:		db	"	[Cache]		: 2nd-level cache: 128 KBytes, 4-way set associative, 32 byte line size.",0
d_02h42:		db	"	[Cache]		: 2nd-level cache: 256 KBytes, 4-way set associative, 32 byte line size.",0
d_02h43:		db	"	[Cache]		: 2nd-level cache: 512 KBytes, 4-way set associative, 32 byte line size.",0
d_02h44:		db	"	[Cache]		: 2nd-level cache: 1 MByte, 4-way set associative, 32 byte line size.",0
d_02h45:		db	"	[Cache]		: 2nd-level cache: 2 MByte, 4-way set associative, 32 byte line size.",0
d_02h46:		db	"	[Cache]		: 3rd-level cache: 4 MByte, 4-way set associative, 64 byte line size.",0
d_02h47:		db	"	[Cache]		: 3rd-level cache: 8 MByte, 8-way set associative, 64 byte line size.",0
d_02h48:		db	"	[Cache]		: 2nd-level cache: 3MByte, 12-way set associative, 64 byte line size.",0
d_02h49:		db	"	[Cache]		: 3rd-level cache: 4MB, 16-way set associative, 64-byte line size (Intel Xeon processor MP, Family 0FH, Model 06H); 2nd-level cache: 4 MByte, 16-way set associative, 64 byte line size.",0
d_02h4a:		db	"	[Cache]		: 3rd-level cache: 6MByte, 12-way set associative, 64 byte line size.",0
d_02h4b:		db	"	[Cache]		: 3rd-level cache: 8MByte, 16-way set associative, 64 byte line size.",0
d_02h4c:		db	"	[Cache]		: 3rd-level cache: 12MByte, 12-way set associative, 64 byte line size.",0
d_02h4d:		db	"	[Cache]		: 3rd-level cache: 16MByte, 16-way set associative, 64 byte line size.",0
d_02h4e:		db	"	[Cache]		: 2nd-level cache: 6MByte, 24-way set associative, 64 byte line size.",0
d_02h4f:		db	"	[TLB]		: Instruction TLB: 4 KByte pages, 32 entries.",0
d_02h50:		db	"	[TLB]		: Instruction TLB: 4 KByte and 2-MByte or 4-MByte pages, 64 entries.",0
d_02h51:		db	"	[TLB]		: Instruction TLB: 4 KByte and 2-MByte or 4-MByte pages, 128 entries.",0
d_02h52:		db	"	[TLB]		: Instruction TLB: 4 KByte and 2-MByte or 4-MByte pages, 256 entries.",0
d_02h53:		db	"	[-]		: Reserved.02h.53.",0
d_02h54:		db	"	[-]		: Reserved.02h.54.",0
d_02h55:		db	"	[TLB]		: Instruction TLB: 2-MByte or 4-MByte pages, fully associative, 7 entries.",0
d_02h56:		db	"	[TLB]		: Data TLB0: 4 MByte pages, 4-way set associative, 16 entries.",0
d_02h57:		db	"	[TLB]		: Data TLB0: 4 KByte pages, 4-way associative, 16 entries.",0
d_02h58:		db	"	[-]		: Reserved.02h.58.",0
d_02h59:		db	"	[TLB]		: Data TLB0: 4 KByte pages, fully associative, 16 entries.",0
d_02h5a:		db	"	[TLB]		: Data TLB0: 2 MByte or 4 MByte pages, 4-way set associative, 32 entries.",0
d_02h5b:		db	"	[TLB]		: Data TLB: 4 KByte and 4 MByte pages, 64 entries.",0
d_02h5c:		db	"	[TLB]		: Data TLB: 4 KByte and 4 MByte pages,128 entries.",0
d_02h5d:		db	"	[TLB]		: Data TLB: 4 KByte and 4 MByte pages,256 entries.",0
d_02h5e:		db	"	[-]		: Reserved.02h.5e.",0
d_02h5f:		db	"	[-]		: Reserved.02h.5f.",0
d_02h60:		db	"	[Cache]		: 1st-level data cache: 16 KByte, 8-way set associative, 64 byte line size.",0
d_02h61:		db	"	[TLB]		: Instruction TLB: 4 KByte pages, fully associative, 48 entries.",0
d_02h62:		db	"	[-]		: Reserved.02h.62.",0
d_02h63:		db	"	[TLB]		: Data TLB: 2 MByte or 4 MByte pages, 4-way set associative, 32 entries and a separate array with 1 GByteapages, 4-way set associative, 4 entries.",0
d_02h64:		db	"	[TLB]		: Data TLB: 4 KByte pages, 4-way set associative, 512 entries.",0
d_02h65:		db	"	[-]		: Reserved.02h.65.",0
d_02h66:		db	"	[TLB]		: 1st-level data cache: 8 KByte, 4-way set associative, 64 byte line size.",0
d_02h67:		db	"	[TLB]		: 1st-level data cache: 16 KByte, 4-way set associative, 64 byte line size.",0
d_02h68:		db	"	[TLB]		: 1st-level data cache: 32 KByte, 4-way set associative, 64 byte line size.",0
d_02h69:		db	"	[-]		: Reserved.02h.69.",0
d_02h6a:		db	"	[TLB]		: uTLB: 4 KByte pages, 8-way set associative, 64 entries.",0
d_02h6b:		db	"	[TLB]		: DTLB: 4 KByte pages, 8-way set associative, 256 entries.",0
d_02h6c:		db	"	[TLB]		: DTLB: 2M/4M pages, 8-way set associative, 128 entries.",0
d_02h6d:		db	"	[TLB]		: DTLB: 1 GByte pages, fully associative, 16 entries.",0
d_02h6e:		db	"	[-]		: Reserved.02h.6e.",0
d_02h6f:		db	"	[-]		: Reserved.02h.6f.",0
d_02h70:		db	"	[Cache]		: Trace cache: 12 K-μop, 8-way set associative.",0
d_02h71:		db	"	[Cache]		: Trace cache: 16 K-μop, 8-way set associative.",0
d_02h72:		db	"	[Cache]		: Trace cache: 32 K-μop, 8-way set associative.",0
d_02h73:		db	"	[-]		: Reserved.02h.73.",0
d_02h74:		db	"	[-]		: Reserved.02h.74.",0
d_02h75:		db	"	[-]		: Reserved.02h.75.",0
d_02h76:		db	"	[TLB]		: Instruction TLB: 2M/4M pages, fully associative, 8 entries.",0
d_02h77:		db	"	[-]		: Reserved.02h.77.",0
d_02h78:		db	"	[Cache]		: 2nd-level cache: 1 MByte, 4-way set associative, 64byte line size.",0
d_02h79:		db	"	[Cache]		: 2nd-level cache: 128 KByte, 8-way set associative, 64 byte line size, 2 lines per sector.",0
d_02h7a:		db	"	[Cache]		: 2nd-level cache: 256 KByte, 8-way set associative, 64 byte line size, 2 lines per sector.",0
d_02h7b:		db	"	[Cache]		: 2nd-level cache: 512 KByte, 8-way set associative, 64 byte line size, 2 lines per sector.",0
d_02h7c:		db	"	[Cache]		: 2nd-level cache: 1 MByte, 8-way set associative, 64 byte line size, 2 lines per sector.",0
d_02h7d:		db	"	[Cache]		: 2nd-level cache: 2 MByte, 8-way set associative, 64byte line size.",0
d_02h7e:		db	"	[-]		: Reserved.02h.7e.",0
d_02h7f:		db	"	[Cache]		: 2nd-level cache: 512 KByte, 2-way set associative, 64-byte line size.",0
d_02h80:		db	"	[Cache]		: 2nd-level cache: 512 KByte, 8-way set associative, 64-byte line size.",0
d_02h81:		db	"	[-]		: Reserved.02h.81.",0
d_02h82:		db	"	[Cache]		: 2nd-level cache: 256 KByte, 8-way set associative, 32 byte line size.",0
d_02h83:		db	"	[Cache]		: 2nd-level cache: 512 KByte, 8-way set associative, 32 byte line size.",0
d_02h84:		db	"	[Cache]		: 2nd-level cache: 1 MByte, 8-way set associative, 32 byte line size.",0
d_02h85:		db	"	[Cache]		: 2nd-level cache: 2 MByte, 8-way set associative, 32 byte line size.",0
d_02h86:		db	"	[Cache]		: 2nd-level cache: 512 KByte, 4-way set associative, 64 byte line size.",0
d_02h87:		db	"	[Cache]		: 2nd-level cache: 1 MByte, 8-way set associative, 64 byte line size.",0
d_02h88:		db	"	[-]		: Reserved.02h.88.",0
d_02h89:		db	"	[-]		: Reserved.02h.89.",0
d_02h8a:		db	"	[-]		: Reserved.02h.8a.",0
d_02h8b:		db	"	[-]		: Reserved.02h.8b.",0
d_02h8c:		db	"	[-]		: Reserved.02h.8c.",0
d_02h8d:		db	"	[-]		: Reserved.02h.8d.",0
d_02h8e:		db	"	[-]		: Reserved.02h.8e.",0
d_02h8f:		db	"	[-]		: Reserved.02h.8f.",0
d_02h90:		db	"	[-]		: Reserved.02h.90.",0
d_02h91:		db	"	[-]		: Reserved.02h.91.",0
d_02h92:		db	"	[-]		: Reserved.02h.92.",0
d_02h93:		db	"	[-]		: Reserved.02h.93.",0
d_02h94:		db	"	[-]		: Reserved.02h.94.",0
d_02h95:		db	"	[-]		: Reserved.02h.95.",0
d_02h96:		db	"	[-]		: Reserved.02h.96.",0
d_02h97:		db	"	[-]		: Reserved.02h.97.",0
d_02h98:		db	"	[-]		: Reserved.02h.98.",0
d_02h99:		db	"	[-]		: Reserved.02h.99.",0
d_02h9a:		db	"	[-]		: Reserved.02h.9a.",0
d_02h9b:		db	"	[-]		: Reserved.02h.9b.",0
d_02h9c:		db	"	[-]		: Reserved.02h.9c.",0
d_02h9d:		db	"	[-]		: Reserved.02h.9d.",0
d_02h9e:		db	"	[-]		: Reserved.02h.9e.",0
d_02h9f:		db	"	[-]		: Reserved.02h.9f.",0
d_02ha0:		db	"	[DTLB]		: DTLB: 4k pages, fully associative, 32 entries.",0
d_02ha1:		db	"	[-]		: Reserved.02h.a1.",0
d_02ha2:		db	"	[-]		: Reserved.02h.a2.",0
d_02ha3:		db	"	[-]		: Reserved.02h.a3.",0
d_02ha4:		db	"	[-]		: Reserved.02h.a4.",0
d_02ha5:		db	"	[-]		: Reserved.02h.a5.",0
d_02ha6:		db	"	[-]		: Reserved.02h.a6.",0
d_02ha7:		db	"	[-]		: Reserved.02h.a7.",0
d_02ha8:		db	"	[-]		: Reserved.02h.a8.",0
d_02ha9:		db	"	[-]		: Reserved.02h.a9.",0
d_02haa:		db	"	[-]		: Reserved.02h.aa.",0
d_02hab:		db	"	[-]		: Reserved.02h.ab.",0
d_02hac:		db	"	[-]		: Reserved.02h.ac.",0
d_02had:		db	"	[-]		: Reserved.02h.ad.",0
d_02hae:		db	"	[-]		: Reserved.02h.ae.",0
d_02haf:		db	"	[-]		: Reserved.02h.af.",0
d_02hb0:		db	"	[TLB]		: Instruction TLB: 4 KByte pages, 4-way set associative, 128 entries.",0
d_02hb1:		db	"	[TLB]		: Instruction TLB: 2M pages, 4-way, 8 entries or 4M pages, 4-way, 4 entries.",0
d_02hb2:		db	"	[TLB]		: Instruction TLB: 4KByte pages, 4-way set associative, 64 entries.",0
d_02hb3:		db	"	[TLB]		: Data TLB: 4 KByte pages, 4-way set associative, 128 entries.",0
d_02hb4:		db	"	[TLB]		: Data TLB1: 4 KByte pages, 4-way associative, 256 entries.",0
d_02hb5:		db	"	[TLB]		: Instruction TLB: 4KByte pages, 8-way set associative, 64 entries.",0
d_02hb6:		db	"	[TLB]		: Instruction TLB: 4KByte pages, 8-way set associative, 128 entries.",0
d_02hb7:		db	"	[-]		: Reserved.02h.b7.",0
d_02hb8:		db	"	[-]		: Reserved.02h.b8.",0
d_02hb9:		db	"	[-]		: Reserved.02h.b9.",0
d_02hba:		db	"	[TLB]		: Data TLB1: 4 KByte pages, 4-way associative, 64 entries.",0
d_02hbb:		db	"	[-]		: Reserved.02h.bb.",0
d_02hbc:		db	"	[-]		: Reserved.02h.bc.",0
d_02hbd:		db	"	[-]		: Reserved.02h.bd.",0
d_02hbe:		db	"	[-]		: Reserved.02h.be.",0
d_02hbf:		db	"	[-]		: Reserved.02h.bf.",0
d_02hc0:		db	"	[TLB]		: Data TLB: 4 KByte and 4 MByte pages, 4-way associative, 8 entries.",0
d_02hc1:		db	"	[STLB]		: Shared 2nd-Level TLB: 4 KByte/2MByte pages, 8-way associative, 1024 entries.",0
d_02hc2:		db	"	[DTLB]		: DTLB: 4 KByte/2 MByte pages, 4-way associative, 16 entries.",0
d_02hc3:		db	"	[STLB]		: Shared 2nd-Level TLB: 4 KByte /2 MByte pages, 6-way associative, 1536 entries. Also 1GBbyte pages, 4-way, 16 entries.",0
d_02hc4:		db	"	[DTLB]		: DTLB: 2M/4M Byte pages, 4-way associative, 32 entries.",0
d_02hc5:		db	"	[-]		: Reserved.02h.c5.",0
d_02hc6:		db	"	[-]		: Reserved.02h.c6.",0
d_02hc7:		db	"	[-]		: Reserved.02h.c7.",0
d_02hc8:		db	"	[-]		: Reserved.02h.c8.",0
d_02hc9:		db	"	[-]		: Reserved.02h.c9.",0
d_02hca:		db	"	[STLB]		: Shared 2nd-Level TLB: 4 KByte pages, 4-way associative, 512 entries.",0
d_02hcb:		db	"	[-]		: Reserved.02h.cb.",0
d_02hcc:		db	"	[-]		: Reserved.02h.cc.",0
d_02hcd:		db	"	[-]		: Reserved.02h.cd.",0
d_02hce:		db	"	[-]		: Reserved.02h.ce.",0
d_02hcf:		db	"	[-]		: Reserved.02h.cf.",0
d_02hd0:		db	"	[Cache]		: 3rd-level cache: 512 KByte, 4-way set associative, 64 byte line size.",0
d_02hd1:		db	"	[Cache]		: 3rd-level cache: 1 MByte, 4-way set associative, 64 byte line size.",0
d_02hd2:		db	"	[Cache]		: 3rd-level cache: 2 MByte, 4-way set associative, 64 byte line size.",0
d_02hd3:		db	"	[-]		: Reserved.02h.d3.",0
d_02hd4:		db	"	[-]		: Reserved.02h.d4.",0
d_02hd5:		db	"	[-]		: Reserved.02h.d5.",0
d_02hd6:		db	"	[Cache]		: 3rd-level cache: 1 MByte, 8-way set associative, 64 byte line size.",0
d_02hd7:		db	"	[Cache]		: 3rd-level cache: 2 MByte, 8-way set associative, 64 byte line size.",0
d_02hd8:		db	"	[Cache]		: 3rd-level cache: 4 MByte, 8-way set associative, 64 byte line size.",0
d_02hd9:		db	"	[-]		: Reserved.02h.d9.",0
d_02hda:		db	"	[-]		: Reserved.02h.da.",0
d_02hdb:		db	"	[-]		: Reserved.02h.db.",0
d_02hdc:		db	"	[Cache]		: 3rd-level cache: 1.5 MByte, 12-way set associative, 64 byte line size.",0
d_02hdd:		db	"	[Cache]		: 3rd-level cache: 3 MByte, 12-way set associative, 64 byte line size.",0
d_02hde:		db	"	[Cache]		: 3rd-level cache: 6 MByte, 12-way set associative, 64 byte line size.",0
d_02hdf:		db	"	[-]		: Reserved.02h.df.",0
d_02he0:		db	"	[-]		: Reserved.02h.e0.",0
d_02he1:		db	"	[-]		: Reserved.02h.e1.",0
d_02he2:		db	"	[Cache]		: 3rd-level cache: 2 MByte, 16-way set associative, 64 byte line size.",0
d_02he3:		db	"	[Cache]		: 3rd-level cache: 4 MByte, 16-way set associative, 64 byte line size.",0
d_02he4:		db	"	[Cache]		: 3rd-level cache: 8 MByte, 16-way set associative, 64 byte line size.",0
d_02he5:		db	"	[-]		: Reserved.02h.e5.",0
d_02he6:		db	"	[-]		: Reserved.02h.e6.",0
d_02he7:		db	"	[-]		: Reserved.02h.e7.",0
d_02he8:		db	"	[-]		: Reserved.02h.e8.",0
d_02he9:		db	"	[-]		: Reserved.02h.e9.",0
d_02hea:		db	"	[Cache]		: 3rd-level cache: 12MByte, 24-way set associative, 64 byte line size.",0
d_02heb:		db	"	[Cache]		: 3rd-level cache: 18MByte, 24-way set associative, 64 byte line size.",0
d_02hec:		db	"	[Cache]		: 3rd-level cache: 24MByte, 24-way set associative, 64 byte line size.",0
d_02hed:		db	"	[-]		: Reserved.02h.ed.",0
d_02hee:		db	"	[-]		: Reserved.02h.ee.",0
d_02hef:		db	"	[-]		: Reserved.02h.ef.",0
d_02hf0:		db	"	[Prefetch]	: 64-Byte prefetching.",0
d_02hf1:		db	"	[Prefetch]	: 128-Byte prefetching.",0
d_02hf2:		db	"	[-]		: Reserved.02h.f2.",0
d_02hf3:		db	"	[-]		: Reserved.02h.f3.",0
d_02hf4:		db	"	[-]		: Reserved.02h.f4.",0
d_02hf5:		db	"	[-]		: Reserved.02h.f5.",0
d_02hf6:		db	"	[-]		: Reserved.02h.f6.",0
d_02hf7:		db	"	[-]		: Reserved.02h.f7.",0
d_02hf8:		db	"	[-]		: Reserved.02h.f8.",0
d_02hf9:		db	"	[-]		: Reserved.02h.f9.",0
d_02hfa:		db	"	[-]		: Reserved.02h.fa.",0
d_02hfb:		db	"	[-]		: Reserved.02h.fb.",0
d_02hfc:		db	"	[-]		: Reserved.02h.fc.",0
d_02hfd:		db	"	[-]		: Reserved.02h.fd.",0
d_02hfe:		db	"	[General]	: CPUID leaf 2 does not report TLB descriptor information; use CPUID leaf 18H to query TLB and other address translation parameters.",0
d_02hff:		db	"	[General]	: CPUID leaf 2 does not report cache descriptor information, use CPUID leaf 4 to query cache parameters.",0
d_03h:			db	"Processor serial number (PSN) is not supported in the Pentium 4 processor or later:",0
d_03h0063:		db	"]	: processor serial number. (Available in Pentium III processor only).",0
d_04h:			db	"Deterministic Cache Parameters Leaf:",0
d_04heax00040:		db	"	[Null - No more caches.",0
d_04heax00041:		db	"	[Data Cache.",0
d_04heax00042:		db	"	[Instruction Cache.",0
d_04heax00043:		db	"	[Unified Cache.",0
d_04heax0004x:		db	"	[Reserved.",0
d_04heax0004:		db	"]	: Cache Type",0
d_04heax0507:		db	"]		: Cache Level.",0
d_04heax08:		db	"	[+]		: Self Initializing cache level (does not need SW initialization).",0
d_04heax09:		db	"	[Fully Associative cache.]",0
d_04heax1425:		db	"]		: Maximum number of addressable IDs for logical processors sharing this cache.",0
d_04heax2631:		db	"]		: Maximum number of addressable IDs for processor cores in the physical package.",0
d_04hebx0011:		db	"]		: L = System Coherency Line Size.",0
d_04hebx1221:		db	"]		: P = Physical Line partitions.",0
d_04hebx2231:		db	"]		: W = Ways of associativity.",0
d_04hecx:		db	"]	: S = Number of Sets.",0
d_04hebxecx:		db	"]	: This Cache Size in Bytes.",0
d_04hedx00:		db	"	[+]		: Write-Back Invalidate/Invalidate. WBINVD/INVD from threads sharing this cache acts upon lower level caches for threads sharing this cache.",0
d_04hedx01:		db	"	[+]		: Write-Back Invalidate/Invalidate. WBINVD/INVD is not guaranteed to act upon lower level caches of non-originating threads sharing this cache.",0
d_04hedx10:		db	"	[+]		: Cache Inclusiveness. Cache is not inclusive of lower cache levels.",0
d_04hedx11:		db	"	[+]		: Cache Inclusiveness. Cache is inclusive of lower cache levels.",0
d_04hedx20:		db	"	[+]		: Complex Cache Indexing. Direct mapped cache.",0
d_04hedx21:		db	"	[+]		: Complex Cache Indexing. A complex function is used to index the cache, potentially using all address bits.",0
d_05h:			db	"MONITOR/MWAIT Leaf:",0
d_05heax0015:		db	"]		: Smallest monitor-line size in bytes (default is processor's monitor granularity).",0
d_05hebx0015:		db	"]		: Largest monitor-line size in bytes (default is processor's monitor granularity).",0
d_05hecx00:		db	"	[+]		: Enumeration of Monitor-Mwait extensions (beyond EAX and EBX registers) supported.",0
d_05hecx01:		db	"	[+]		: Supports treating interrupts as break-event for MWAIT, even when interrupts disabled.",0
d_05hedx0003:		db	"]		: Number of C0 sub C-states supported using MWAIT. (The definition of C0 states for MWAIT extension are processor-specific C-states, not ACPI C-states.)",0
d_05hedx0407:		db	"]		: Number of C1 sub C-states supported using MWAIT. (The definition of C1 states for MWAIT extension are processor-specific C-states, not ACPI C-states.)",0
d_05hedx0811:		db	"]		: Number of C2 sub C-states supported using MWAIT. (The definition of C2 states for MWAIT extension are processor-specific C-states, not ACPI C-states.)",0
d_05hedx1215:		db	"]		: Number of C3 sub C-states supported using MWAIT. (The definition of C3 states for MWAIT extension are processor-specific C-states, not ACPI C-states.)",0
d_05hedx1619:		db	"]		: Number of C4 sub C-states supported using MWAIT. (The definition of C4 states for MWAIT extension are processor-specific C-states, not ACPI C-states.)",0
d_05hedx2023:		db	"]		: Number of C5 sub C-states supported using MWAIT. (The definition of C5 states for MWAIT extension are processor-specific C-states, not ACPI C-states.)",0
d_05hedx2427:		db	"]		: Number of C6 sub C-states supported using MWAIT. (The definition of C6 states for MWAIT extension are processor-specific C-states, not ACPI C-states.)",0
d_05hedx2831:		db	"]		: Number of C7 sub C-states supported using MWAIT. (The definition of C7 states for MWAIT extension are processor-specific C-states, not ACPI C-states.)",0
d_06h:			db	"Thermal and Power Management Leaf:",0
d_06heax:		db	1,0
d_06heax00:		db	"	[+]		: Digital temperature sensor is supported.",0
d_06heax01:		db	"	[+]		: Intel Turbo Boost Technology available.",0
d_06heax02:		db	"	[+]		: ARAT. APIC-Timer-always-running feature is supported.",0
d_06heax03:		db	"	[-]		: Reserved.06.eax.03",0
d_06heax04:		db	"	[+]		: PLN. Power limit notification controls are supported.",0
d_06heax05:		db	"	[+]		: ECMD. Clock modulation duty cycle extension is supported.",0
d_06heax06:		db	"	[+]		: PTM. Package thermal management is supported.",0
d_06heax07:		db	"	[+]		: HWP. HWP base registers (IA32_PM_ENABLE[bit 0], IA32_HWP_CAPABILITIES, IA32_HWP_REQUEST, IA32_HWP_STATUS) are supported",0
d_06heax08:		db	"	[+]		: HWP_Notification. IA32_HWP_INTERRUPT MSR is supported.",0
d_06heax09:		db	"	[+]		: HWP_Activity_Window. IA32_HWP_REQUEST[bits 41:32] is supported.",0
d_06heax10:		db	"	[+]		: HWP_Energy_Performance_Preference. IA32_HWP_REQUEST[bits 31:24] is supported.",0
d_06heax11:		db	"	[+]		: HWP_Package_Level_Request. IA32_HWP_REQUEST_PKG MSR is supported.",0
d_06heax12:		db	"	[-]		: Reserved.06.eax.12",0
d_06heax13:		db	"	[+]		: HDC. HDC base registers IA32_PKG_HDC_CTL, IA32_PM_CTL1, IA32_THREAD_STALL MSRs are supported.",0
d_06heax14:		db	"	[+]		: Intel® Turbo Boost Max Technology 3.0 available.",0
d_06heax15:		db	"	[-]		: Reserved.06.eax.15",0
d_06heax16:		db	"	[-]		: Reserved.06.eax.16",0
d_06heax17:		db	"	[-]		: Reserved.06.eax.17",0
d_06heax18:		db	"	[-]		: Reserved.06.eax.18",0
d_06heax19:		db	"	[-]		: Reserved.06.eax.19",0
d_06heax20:		db	"	[-]		: Reserved.06.eax.20",0
d_06heax21:		db	"	[-]		: Reserved.06.eax.21",0
d_06heax22:		db	"	[-]		: Reserved.06.eax.22",0
d_06heax23:		db	"	[-]		: Reserved.06.eax.23",0
d_06heax24:		db	"	[-]		: Reserved.06.eax.24",0
d_06heax25:		db	"	[-]		: Reserved.06.eax.25",0
d_06heax26:		db	"	[-]		: Reserved.06.eax.26",0
d_06heax27:		db	"	[-]		: Reserved.06.eax.27",0
d_06heax28:		db	"	[-]		: Reserved.06.eax.28",0
d_06heax29:		db	"	[-]		: Reserved.06.eax.29",0
d_06heax30:		db	"	[-]		: Reserved.06.eax.30",0
d_06heax31:		db	"	[-]		: Reserved.06.eax.31",0
d_06hebx0003:		db	"]		: Number of Interrupt Thresholds in Digital Thermal Sensor.",0
d_06hecx00:		db	"	[+]		: Hardware Coordination Feedback Capability (Presence of IA32_MPERF and IA32_APERF). The capability to provide a measure of delivered processor performance (since last reset of the counters), as a percentage of the expected processor performance when running at the TSC frequency.",0
d_06hecx03:		db	"	[+]		: The processor supports performance-energy bias preference and it also implies the presence of a new architectural MSR called IA32_ENERGY_PERF_BIAS (1B0H).",0
d_07h:			db	"Structured Extended Feature Flags Enumeration Leaf:",0
d_07heax:		db	"]	: Reports the maximum input value for supported leaf 7 sub-leaves.",0
d_07hebx:		db	1,0
d_07hebx00:		db	"	[+]		: FSGSBASE. Supports RDFSBASE/RDGSBASE/WRFSBASE/WRGSBASE.",0
d_07hebx01:		db	"	[+]		: IA32_TSC_ADJUST MSR is supported.",0
d_07hebx02:		db	"	[+]		: SGX. Supports Intel® Software Guard Extensions (Intel® SGX Extensions).",0
d_07hebx03:		db	"	[+]		: BMI1.",0
d_07hebx04:		db	"	[+]		: HLE.",0
d_07hebx05:		db	"	[+]		: AVX2.",0
d_07hebx06:		db	"	[+]		: FDP_EXCPTN_ONLY. x87 FPU Data Pointer updated only on x87 exceptions.",0
d_07hebx07:		db	"	[+]		: SMEP. Supports Supervisor-Mode Execution Prevention.",0
d_07hebx08:		db	"	[+]		: BMI2.",0
d_07hebx09:		db	"	[+]		: Supports Enhanced REP MOVSB/STOSB.",0
d_07hebx10:		db	"	[+]		: INVPCID. Supports INVPCID instruction for system software that manages process-context identifiers..",0
d_07hebx11:		db	"	[+]		: RTM.",0
d_07hebx12:		db	"	[+]		: RDT-M. Supports Intel® Resource Director Technology (Intel® RDT) Monitoring capability.",0
d_07hebx13:		db	"	[+]		: Deprecates FPU CS and FPU DS values.",0
d_07hebx14:		db	"	[+]		: MPX. Supports Intel® Memory Protection Extensions.",0
d_07hebx15:		db	"	[+]		: RDT-A. Supports Intel® Resource Director Technology (Intel® RDT) Allocation capability.",0
d_07hebx16:		db	"	[+]		: AVX512F.",0
d_07hebx17:		db	"	[+]		: AVX512DQ.",0
d_07hebx18:		db	"	[+]		: RDSEED.",0
d_07hebx19:		db	"	[+]		: ADX.",0
d_07hebx20:		db	"	[+]		: SMAP. Supports Supervisor-Mode Access Prevention (and the CLAC/STAC instructions).",0
d_07hebx21:		db	"	[+]		: AVX512_IFMA.",0
d_07hebx22:		db	"	[-]		: Reserved.07.ebx.22",0
d_07hebx23:		db	"	[+]		: CLFLUSHOPT.",0
d_07hebx24:		db	"	[+]		: CLWB.",0
d_07hebx25:		db	"	[+]		: Intel Processor Trace.",0
d_07hebx26:		db	"	[+]		: AVX512PF. (Intel® Xeon PhiTM only.).",0
d_07hebx27:		db	"	[+]		: AVX512ER. (Intel® Xeon PhiTM only.).",0
d_07hebx28:		db	"	[+]		: AVX512CD.",0
d_07hebx29:		db	"	[+]		: SHA. supports Intel® Secure Hash Algorithm Extensions (Intel® SHA Extensions).",0
d_07hebx30:		db	"	[+]		: AVX512BW.",0
d_07hebx31:		db	"	[+]		: AVX512VL.",0
d_07hebx020:		db	"	[-]		: SGX. Not Supports Intel® Software Guard Extensions (Intel® SGX Extensions).",0
d_07hecx:		db	1,0
d_07hecx00:		db	"	[+]		: PREFETCHWT1. (Intel® Xeon PhiTM only.).",0
d_07hecx01:		db	"	[+]		: AVX512_VBMI.",0
d_07hecx02:		db	"	[+]		: UMIP. Supports user-mode instruction prevention.",0
d_07hecx03:		db	"	[+]		: PKU. Supports protection keys for user-mode pages.",0
d_07hecx04:		db	"	[+]		: OSPKE. OS has set CR4.PKE to enable protection keys (and the RDPKRU/WRPKRU instruc-tions).",0
d_07hecx1721:		db	"]		: The value of MAWAU used by the BNDLDX and BNDSTX instructions in 64-bit mode.",0
d_07hecx22:		db	"	[+]		: RDPID. Supports Read Processor ID.",0
d_07hecx30:		db	"	[+]		: SGX_LC. Supports SGX Launch Configuration.",0
; Undefined	d_08h:			db	"Undefined.08h:",0
d_09h:			db	"Direct Cache Access Information Leaf:",0
d_09heax0031:		db	"]	: Value of IA32_PLATFORM_DCA_CAP MSR (address 1F8H).",0
d_0ah:			db	"Architectural Performance Monitoring Leaf:",0
d_0aheax0007:		db	"]		: Version ID of architectural performance monitoring.",0
d_0aheax0815:		db	"]		: Number of general-purpose performance monitoring counter per logical processor.",0
d_0aheax1623:		db	"]		: Bit width of general-purpose, performance monitoring counter.",0
d_0aheax2431:		db	"]		: Length of EBX bit vector to enumerate architectural performance monitoring events.",0
d_0ahebx:		db	1,0
d_0ahebx00:		db	"	[+]		: Core cycle event not available.",0
d_0ahebx01:		db	"	[+]		: Instruction retired event not available.",0
d_0ahebx02:		db	"	[+]		: Reference cycles event not available.",0
d_0ahebx03:		db	"	[+]		: Last-level cache reference event not available.",0
d_0ahebx04:		db	"	[+]		: Last-level cache misses event not available",0
d_0ahebx05:		db	"	[+]		: Branch instruction retired event not available.",0
d_0ahebx06:		db	"	[+]		: Branch mispredict retired event not available.",0
d_0ahebx07:		db	"	[-]		: Reserved.0a.ebx.07",0
d_0ahebx08:		db	"	[-]		: Reserved.0a.ebx.08",0
d_0ahebx09:		db	"	[-]		: Reserved.0a.ebx.09",0
d_0ahebx10:		db	"	[-]		: Reserved.0a.ebx.10",0
d_0ahebx11:		db	"	[-]		: Reserved.0a.ebx.11",0
d_0ahebx12:		db	"	[-]		: Reserved.0a.ebx.12",0
d_0ahebx13:		db	"	[-]		: Reserved.0a.ebx.13",0
d_0ahebx14:		db	"	[-]		: Reserved.0a.ebx.14",0
d_0ahebx15:		db	"	[-]		: Reserved.0a.ebx.15",0
d_0ahebx16:		db	"	[-]		: Reserved.0a.ebx.16",0
d_0ahebx17:		db	"	[-]		: Reserved.0a.ebx.17",0
d_0ahebx18:		db	"	[-]		: Reserved.0a.ebx.18",0
d_0ahebx19:		db	"	[-]		: Reserved.0a.ebx.19",0
d_0ahebx20:		db	"	[-]		: Reserved.0a.ebx.20",0
d_0ahebx21:		db	"	[-]		: Reserved.0a.ebx.21",0
d_0ahebx22:		db	"	[-]		: Reserved.0a.ebx.22",0
d_0ahebx23:		db	"	[-]		: Reserved.0a.ebx.23",0
d_0ahebx24:		db	"	[-]		: Reserved.0a.ebx.24",0
d_0ahebx25:		db	"	[-]		: Reserved.0a.ebx.25",0
d_0ahebx26:		db	"	[-]		: Reserved.0a.ebx.26",0
d_0ahebx27:		db	"	[-]		: Reserved.0a.ebx.27",0
d_0ahebx28:		db	"	[-]		: Reserved.0a.ebx.28",0
d_0ahebx29:		db	"	[-]		: Reserved.0a.ebx.29",0
d_0ahebx30:		db	"	[-]		: Reserved.0a.ebx.30",0
d_0ahebx31:		db	"	[-]		: Reserved.0a.ebx.31",0
d_0ahedx0004:		db	"]		: Number of fixed-function performance counters (if Version ID > 1).",0
d_0ahedx0512:		db	"]		: Bit width of fixed-function performance counters (if Version ID > 1).",0
d_0ahedx15:		db	"	[+]		: AnyThread deprecation.",0
d_0bh:			db	"Extended Topology Enumeration Leaf:",0
d_0bheax0004:		db	"]		: Number of bits to shift right on x2APIC ID to get a unique topology ID of the next level type. All logical processors with the same next level ID share current level. Software should use this field to enumerate processor topology of the system.",0
d_0bhebx0015:		db	"]		: Number of logical processors at this level type. The number reflects configuration as shipped by Intel. (Software must not use to enumerate processor topology of the system. This value in this field is only intended for display/diagnostic purposes. The actual number of logical processors available to BIOS/OS/Applications may be different from the value of this, depending on software and platform hardware configurations.)",0
d_0bhecx0007:		db	"]		: Level number. Same value in input.",0
d_0bhecx08150:		db	"]		: Invalid Level type.",0
d_0bhecx08151:		db	"]		: SMT Level type.",0
d_0bhecx08152:		db	"]		: Core Level type.",0
d_0bhecx0815x:		db	"]		: Reserved Level type.",0
d_0bhedx0031:		db	"]	: x2APIC ID the current logical processor.",0
; Undefined	d_0ch:			db	"Undefined.0ch:",0
d_0dh0:			db	"Processor Extended State Enumeration Main Leaf:",0
d_0dh0eax:		db	"	Reports the supported bits of the lower 32 bits of XCR0. XCR0[n] can be set to 1 only if is:",0
d_0dh0eax00:		db	"	[+]		: 00 - x87 state.",0
d_0dh0eax01:		db	"	[+]		: 01 - SSE state.",0
d_0dh0eax02:		db	"	[+]		: 02 - AVX state.",0
d_0dh0eax03:		db	"	[+]		: 03 - MPX state.",0
d_0dh0eax04:		db	"	[+]		: 04 - MPX state.",0
d_0dh0eax05:		db	"	[+]		: 05 - AVX-512 state.",0
d_0dh0eax06:		db	"	[+]		: 06 - AVX-512 state.",0
d_0dh0eax07:		db	"	[+]		: 07 - AVX-512 state.",0
d_0dh0eax08:		db	"	[+]		: 08 - Used for IA32_XSS.",0
d_0dh0eax09:		db	"	[+]		: 09 - PKRU state.",0
d_0dh0eax10:		db	"	[-]		: Reserved.0d.0.eax.10",0
d_0dh0eax11:		db	"	[-]		: Reserved.0d.0.eax.11",0
d_0dh0eax12:		db	"	[-]		: Reserved.0d.0.eax.12",0
d_0dh0eax13:		db	"	[-]		: Reserved.0d.0.eax.13",0
d_0dh0eax14:		db	"	[-]		: Reserved.0d.0.eax.14",0
d_0dh0eax15:		db	"	[-]		: Reserved.0d.0.eax.15",0
d_0dh0eax16:		db	"	[-]		: Reserved.0d.0.eax.16",0
d_0dh0eax17:		db	"	[-]		: Reserved.0d.0.eax.17",0
d_0dh0eax18:		db	"	[-]		: Reserved.0d.0.eax.18",0
d_0dh0eax19:		db	"	[-]		: Reserved.0d.0.eax.19",0
d_0dh0eax20:		db	"	[-]		: Reserved.0d.0.eax.20",0
d_0dh0eax21:		db	"	[-]		: Reserved.0d.0.eax.21",0
d_0dh0eax22:		db	"	[-]		: Reserved.0d.0.eax.22",0
d_0dh0eax23:		db	"	[-]		: Reserved.0d.0.eax.23",0
d_0dh0eax24:		db	"	[-]		: Reserved.0d.0.eax.24",0
d_0dh0eax25:		db	"	[-]		: Reserved.0d.0.eax.25",0
d_0dh0eax26:		db	"	[-]		: Reserved.0d.0.eax.26",0
d_0dh0eax27:		db	"	[-]		: Reserved.0d.0.eax.27",0
d_0dh0eax28:		db	"	[-]		: Reserved.0d.0.eax.28",0
d_0dh0eax29:		db	"	[-]		: Reserved.0d.0.eax.29",0
d_0dh0eax30:		db	"	[-]		: Reserved.0d.0.eax.30",0
d_0dh0eax31:		db	"	[-]		: Reserved.0d.0.eax.31",0
d_0dh0ebx0031:		db	"]	: Maximum size (bytes, from the beginning of the XSAVE/XRSTOR save area) required by enabled features in XCR0. May be different than ECX if some features at the end of the XSAVE save area are not enabled.",0
d_0dh0ecx0031:		db	"]	: Maximum size (bytes, from the beginning of the XSAVE/XRSTOR save area) of the XSAVE/XRSTOR save area required by all supported features in the processor, i.e., all the valid bit fields in XCR0.",0
d_0dh0edx:		db	"	Reports the supported bits of the upper 32 bits of XCR0. XCR0[n+32] can be set to 1 only if is :",0
d_0dh0edx00:		db	"	[-]		: Reserved.0d.0.edx.00",0
d_0dh0edx01:		db	"	[-]		: Reserved.0d.0.edx.01",0
d_0dh0edx02:		db	"	[-]		: Reserved.0d.0.edx.02",0
d_0dh0edx03:		db	"	[-]		: Reserved.0d.0.edx.03",0
d_0dh0edx04:		db	"	[-]		: Reserved.0d.0.edx.04",0
d_0dh0edx05:		db	"	[-]		: Reserved.0d.0.edx.05",0
d_0dh0edx06:		db	"	[-]		: Reserved.0d.0.edx.06",0
d_0dh0edx07:		db	"	[-]		: Reserved.0d.0.edx.07",0
d_0dh0edx08:		db	"	[-]		: Reserved.0d.0.edx.08",0
d_0dh0edx09:		db	"	[-]		: Reserved.0d.0.edx.09",0
d_0dh0edx10:		db	"	[-]		: Reserved.0d.0.edx.10",0
d_0dh0edx11:		db	"	[-]		: Reserved.0d.0.edx.11",0
d_0dh0edx12:		db	"	[-]		: Reserved.0d.0.edx.12",0
d_0dh0edx13:		db	"	[-]		: Reserved.0d.0.edx.13",0
d_0dh0edx14:		db	"	[-]		: Reserved.0d.0.edx.14",0
d_0dh0edx15:		db	"	[-]		: Reserved.0d.0.edx.15",0
d_0dh0edx16:		db	"	[-]		: Reserved.0d.0.edx.16",0
d_0dh0edx17:		db	"	[-]		: Reserved.0d.0.edx.17",0
d_0dh0edx18:		db	"	[-]		: Reserved.0d.0.edx.18",0
d_0dh0edx19:		db	"	[-]		: Reserved.0d.0.edx.19",0
d_0dh0edx20:		db	"	[-]		: Reserved.0d.0.edx.20",0
d_0dh0edx21:		db	"	[-]		: Reserved.0d.0.edx.21",0
d_0dh0edx22:		db	"	[-]		: Reserved.0d.0.edx.22",0
d_0dh0edx23:		db	"	[-]		: Reserved.0d.0.edx.23",0
d_0dh0edx24:		db	"	[-]		: Reserved.0d.0.edx.24",0
d_0dh0edx25:		db	"	[-]		: Reserved.0d.0.edx.25",0
d_0dh0edx26:		db	"	[-]		: Reserved.0d.0.edx.26",0
d_0dh0edx27:		db	"	[-]		: Reserved.0d.0.edx.27",0
d_0dh0edx28:		db	"	[-]		: Reserved.0d.0.edx.28",0
d_0dh0edx29:		db	"	[-]		: Reserved.0d.0.edx.29",0
d_0dh0edx30:		db	"	[-]		: Reserved.0d.0.edx.30",0
d_0dh0edx31:		db	"	[-]		: Reserved.0d.0.edx.31",0
d_0dh1:			db	"Processor Extended State Enumeration Sub-leaf:",0
d_0dh1eax:		db	1,0
d_0dh1eax00:		db	"	[+]		: XSAVEOPT is available.",0
d_0dh1eax01:		db	"	[+]		: Supports XSAVEC and the compacted form of XRSTOR.",0
d_0dh1eax02:		db	"	[+]		: Supports XGETBV with ECX = 1.",0
d_0dh1eax03:		db	"	[+]		: Supports XSAVES/XRSTORS and IA32_XSS.",0
d_0dh1eax04:		db	"	[-]		: Reserved.0d.1.eax.04",0
d_0dh1eax05:		db	"	[-]		: Reserved.0d.1.eax.05",0
d_0dh1eax06:		db	"	[-]		: Reserved.0d.1.eax.06",0
d_0dh1eax07:		db	"	[-]		: Reserved.0d.1.eax.07",0
d_0dh1eax08:		db	"	[-]		: Reserved.0d.1.eax.08",0
d_0dh1eax09:		db	"	[-]		: Reserved.0d.1.eax.09",0
d_0dh1eax10:		db	"	[-]		: Reserved.0d.1.eax.10",0
d_0dh1eax11:		db	"	[-]		: Reserved.0d.1.eax.11",0
d_0dh1eax12:		db	"	[-]		: Reserved.0d.1.eax.12",0
d_0dh1eax13:		db	"	[-]		: Reserved.0d.1.eax.13",0
d_0dh1eax14:		db	"	[-]		: Reserved.0d.1.eax.14",0
d_0dh1eax15:		db	"	[-]		: Reserved.0d.1.eax.15",0
d_0dh1eax16:		db	"	[-]		: Reserved.0d.1.eax.16",0
d_0dh1eax17:		db	"	[-]		: Reserved.0d.1.eax.17",0
d_0dh1eax18:		db	"	[-]		: Reserved.0d.1.eax.18",0
d_0dh1eax19:		db	"	[-]		: Reserved.0d.1.eax.19",0
d_0dh1eax20:		db	"	[-]		: Reserved.0d.1.eax.20",0
d_0dh1eax21:		db	"	[-]		: Reserved.0d.1.eax.21",0
d_0dh1eax22:		db	"	[-]		: Reserved.0d.1.eax.22",0
d_0dh1eax23:		db	"	[-]		: Reserved.0d.1.eax.23",0
d_0dh1eax24:		db	"	[-]		: Reserved.0d.1.eax.24",0
d_0dh1eax25:		db	"	[-]		: Reserved.0d.1.eax.25",0
d_0dh1eax26:		db	"	[-]		: Reserved.0d.1.eax.26",0
d_0dh1eax27:		db	"	[-]		: Reserved.0d.1.eax.27",0
d_0dh1eax28:		db	"	[-]		: Reserved.0d.1.eax.28",0
d_0dh1eax29:		db	"	[-]		: Reserved.0d.1.eax.29",0
d_0dh1eax30:		db	"	[-]		: Reserved.0d.1.eax.30",0
d_0dh1eax31:		db	"	[-]		: Reserved.0d.1.eax.31",0
d_0dh1ebx0031:		db	"]	: The size in bytes of the XSAVE area containing all states enabled by XCRO | IA32_XSS.",0
d_0dh1ecx:		db	"	Reports the supported bits of the lower 32 bits of the IA32_XSS MSR. IA32_XSS[n] can be set to 1 only if is:",0
d_0dh1ecx00:		db	"	[+]		: 00 - Used for XCR0.",0
d_0dh1ecx01:		db	"	[+]		: 01 - Used for XCR0.",0
d_0dh1ecx02:		db	"	[+]		: 02 - Used for XCR0.",0
d_0dh1ecx03:		db	"	[+]		: 03 - Used for XCR0.",0
d_0dh1ecx04:		db	"	[+]		: 04 - Used for XCR0.",0
d_0dh1ecx05:		db	"	[+]		: 05 - Used for XCR0.",0
d_0dh1ecx06:		db	"	[+]		: 06 - Used for XCR0.",0
d_0dh1ecx07:		db	"	[+]		: 07 - Used for XCR0.",0
d_0dh1ecx08:		db	"	[+]		: 08 - PT state.",0
d_0dh1ecx09:		db	"	[+]		: 09 - Used for XCR0.",0
d_0dh1ecx10:		db	"	[-]		: Reserved.0d.1.ecx.10",0
d_0dh1ecx11:		db	"	[-]		: Reserved.0d.1.ecx.11",0
d_0dh1ecx12:		db	"	[-]		: Reserved.0d.1.ecx.12",0
d_0dh1ecx13:		db	"	[-]		: Reserved.0d.1.ecx.13",0
d_0dh1ecx14:		db	"	[-]		: Reserved.0d.1.ecx.14",0
d_0dh1ecx15:		db	"	[-]		: Reserved.0d.1.ecx.15",0
d_0dh1ecx16:		db	"	[-]		: Reserved.0d.1.ecx.16",0
d_0dh1ecx17:		db	"	[-]		: Reserved.0d.1.ecx.17",0
d_0dh1ecx18:		db	"	[-]		: Reserved.0d.1.ecx.18",0
d_0dh1ecx19:		db	"	[-]		: Reserved.0d.1.ecx.19",0
d_0dh1ecx20:		db	"	[-]		: Reserved.0d.1.ecx.20",0
d_0dh1ecx21:		db	"	[-]		: Reserved.0d.1.ecx.21",0
d_0dh1ecx22:		db	"	[-]		: Reserved.0d.1.ecx.22",0
d_0dh1ecx23:		db	"	[-]		: Reserved.0d.1.ecx.23",0
d_0dh1ecx24:		db	"	[-]		: Reserved.0d.1.ecx.24",0
d_0dh1ecx25:		db	"	[-]		: Reserved.0d.1.ecx.25",0
d_0dh1ecx26:		db	"	[-]		: Reserved.0d.1.ecx.26",0
d_0dh1ecx27:		db	"	[-]		: Reserved.0d.1.ecx.27",0
d_0dh1ecx28:		db	"	[-]		: Reserved.0d.1.ecx.28",0
d_0dh1ecx29:		db	"	[-]		: Reserved.0d.1.ecx.29",0
d_0dh1ecx30:		db	"	[-]		: Reserved.0d.1.ecx.30",0
d_0dh1ecx31:		db	"	[-]		: Reserved.0d.1.ecx.31",0
d_0dh1edx:		db	"	Reports the supported bits of the upper 32 bits of the IA32_XSS MSR. IA32_XSS[n+32] can be set to 1 only if is:",0
d_0dh1edx00:		db	"	[-]		: Reserved.0d.1.edx.00",0
d_0dh1edx01:		db	"	[-]		: Reserved.0d.1.edx.01",0
d_0dh1edx02:		db	"	[-]		: Reserved.0d.1.edx.02",0
d_0dh1edx03:		db	"	[-]		: Reserved.0d.1.edx.03",0
d_0dh1edx04:		db	"	[-]		: Reserved.0d.1.edx.04",0
d_0dh1edx05:		db	"	[-]		: Reserved.0d.1.edx.05",0
d_0dh1edx06:		db	"	[-]		: Reserved.0d.1.edx.06",0
d_0dh1edx07:		db	"	[-]		: Reserved.0d.1.edx.07",0
d_0dh1edx08:		db	"	[-]		: Reserved.0d.1.edx.08",0
d_0dh1edx09:		db	"	[-]		: Reserved.0d.1.edx.09",0
d_0dh1edx10:		db	"	[-]		: Reserved.0d.1.edx.10",0
d_0dh1edx11:		db	"	[-]		: Reserved.0d.1.edx.11",0
d_0dh1edx12:		db	"	[-]		: Reserved.0d.1.edx.12",0
d_0dh1edx13:		db	"	[-]		: Reserved.0d.1.edx.13",0
d_0dh1edx14:		db	"	[-]		: Reserved.0d.1.edx.14",0
d_0dh1edx15:		db	"	[-]		: Reserved.0d.1.edx.15",0
d_0dh1edx16:		db	"	[-]		: Reserved.0d.1.edx.16",0
d_0dh1edx17:		db	"	[-]		: Reserved.0d.1.edx.17",0
d_0dh1edx18:		db	"	[-]		: Reserved.0d.1.edx.18",0
d_0dh1edx19:		db	"	[-]		: Reserved.0d.1.edx.19",0
d_0dh1edx20:		db	"	[-]		: Reserved.0d.1.edx.20",0
d_0dh1edx21:		db	"	[-]		: Reserved.0d.1.edx.21",0
d_0dh1edx22:		db	"	[-]		: Reserved.0d.1.edx.22",0
d_0dh1edx23:		db	"	[-]		: Reserved.0d.1.edx.23",0
d_0dh1edx24:		db	"	[-]		: Reserved.0d.1.edx.24",0
d_0dh1edx25:		db	"	[-]		: Reserved.0d.1.edx.25",0
d_0dh1edx26:		db	"	[-]		: Reserved.0d.1.edx.26",0
d_0dh1edx27:		db	"	[-]		: Reserved.0d.1.edx.27",0
d_0dh1edx28:		db	"	[-]		: Reserved.0d.1.edx.28",0
d_0dh1edx29:		db	"	[-]		: Reserved.0d.1.edx.29",0
d_0dh1edx30:		db	"	[-]		: Reserved.0d.1.edx.30",0
d_0dh1edx31:		db	"	[-]		: Reserved.0d.1.edx.31",0
d_0dh2:			db	"Processor Extended State Enumeration Sub-leaves:",0
d_0dh2n:		db	"]		: n.",0
d_0dh2eax0031:		db	"]	: The size in bytes (from the offset next value) of the save area for an extended state feature associated with a valid sub-leaf index, n.",0
d_0dh2ebx0031:		db	"]	: The offset in bytes of this extended state component’s save area from the beginning of the XSAVE/XRSTOR area. This field reports 0 if the sub-leaf index, n, does not map to a valid bit in the XCR0 register.",0
d_0dh2ecx000:		db	"	[-]		: If bit n is instead supported in XCR0.",0
d_0dh2ecx001:		db	"	[+]		: If the bit n (corresponding to the sub-leaf index) is supported in the IA32_XSS MSR.",0
d_0dh2ecx01:		db	"	[+]		: If, when the compacted format of an XSAVE area is used, this extended state component located on the next 64-byte boundary following the preceding state component (otherwise, it is located immediately following the preceding state component).",0
; Undefined	d_0eh:			db	"Undefined.0eh:",0
d_0fh0:			db	"Intel Resource Director Technology (Intel RDT) Monitoring Enumeration Sub-leaf:",0
d_0fh0ebx0031:		db	"]	: Maximum range (zero-based) of RMID within this physical processor of all types.",0
d_0fh0edx:		db	1,0
d_0fh0edx00:		db	"	[-]		: Reserved.0f.0.edx.00",0
d_0fh0edx01:		db	"	[+]		: Supports L3 Cache Intel RDT Monitoring.",0
d_0fh0edx02:		db	"	[-]		: Reserved.0f.0.edx.02",0
d_0fh0edx03:		db	"	[-]		: Reserved.0f.0.edx.03",0
d_0fh0edx04:		db	"	[-]		: Reserved.0f.0.edx.04",0
d_0fh0edx05:		db	"	[-]		: Reserved.0f.0.edx.05",0
d_0fh0edx06:		db	"	[-]		: Reserved.0f.0.edx.06",0
d_0fh0edx07:		db	"	[-]		: Reserved.0f.0.edx.07",0
d_0fh0edx08:		db	"	[-]		: Reserved.0f.0.edx.08",0
d_0fh0edx09:		db	"	[-]		: Reserved.0f.0.edx.09",0
d_0fh0edx10:		db	"	[-]		: Reserved.0f.0.edx.10",0
d_0fh0edx11:		db	"	[-]		: Reserved.0f.0.edx.11",0
d_0fh0edx12:		db	"	[-]		: Reserved.0f.0.edx.12",0
d_0fh0edx13:		db	"	[-]		: Reserved.0f.0.edx.13",0
d_0fh0edx14:		db	"	[-]		: Reserved.0f.0.edx.14",0
d_0fh0edx15:		db	"	[-]		: Reserved.0f.0.edx.15",0
d_0fh0edx16:		db	"	[-]		: Reserved.0f.0.edx.16",0
d_0fh0edx17:		db	"	[-]		: Reserved.0f.0.edx.17",0
d_0fh0edx18:		db	"	[-]		: Reserved.0f.0.edx.18",0
d_0fh0edx19:		db	"	[-]		: Reserved.0f.0.edx.19",0
d_0fh0edx20:		db	"	[-]		: Reserved.0f.0.edx.20",0
d_0fh0edx21:		db	"	[-]		: Reserved.0f.0.edx.21",0
d_0fh0edx22:		db	"	[-]		: Reserved.0f.0.edx.22",0
d_0fh0edx23:		db	"	[-]		: Reserved.0f.0.edx.23",0
d_0fh0edx24:		db	"	[-]		: Reserved.0f.0.edx.24",0
d_0fh0edx25:		db	"	[-]		: Reserved.0f.0.edx.25",0
d_0fh0edx26:		db	"	[-]		: Reserved.0f.0.edx.26",0
d_0fh0edx27:		db	"	[-]		: Reserved.0f.0.edx.27",0
d_0fh0edx28:		db	"	[-]		: Reserved.0f.0.edx.28",0
d_0fh0edx29:		db	"	[-]		: Reserved.0f.0.edx.29",0
d_0fh0edx30:		db	"	[-]		: Reserved.0f.0.edx.30",0
d_0fh0edx31:		db	"	[-]		: Reserved.0f.0.edx.31",0
d_0fh1:			db	"L3 Cache Intel RDT Monitoring Capability Enumeration Sub-leaf:",0
d_0fh1ebx0031:		db	"]	: Conversion factor from reported IA32_QM_CTR value to occupancy metric (bytes).",0
d_0fh1ecx0031:		db	"]	: Maximum range (zero-based) of RMID of this resource type..",0
d_0fh1edx:		db	1,0
d_0fh1edx00:		db	"	[+]		: Supports L3 occupancy monitoring.",0
d_0fh1edx01:		db	"	[+]		: Supports L3 Total Bandwidth monitoring.",0
d_0fh1edx02:		db	"	[+]		: Supports L3 Local Bandwidth monitoring.",0
d_0fh1edx03:		db	"	[-]		: Reserved.0f.1.edx.03",0
d_0fh1edx04:		db	"	[-]		: Reserved.0f.1.edx.04",0
d_0fh1edx05:		db	"	[-]		: Reserved.0f.1.edx.05",0
d_0fh1edx06:		db	"	[-]		: Reserved.0f.1.edx.06",0
d_0fh1edx07:		db	"	[-]		: Reserved.0f.1.edx.07",0
d_0fh1edx08:		db	"	[-]		: Reserved.0f.1.edx.08",0
d_0fh1edx09:		db	"	[-]		: Reserved.0f.1.edx.09",0
d_0fh1edx10:		db	"	[-]		: Reserved.0f.1.edx.10",0
d_0fh1edx11:		db	"	[-]		: Reserved.0f.1.edx.11",0
d_0fh1edx12:		db	"	[-]		: Reserved.0f.1.edx.12",0
d_0fh1edx13:		db	"	[-]		: Reserved.0f.1.edx.13",0
d_0fh1edx14:		db	"	[-]		: Reserved.0f.1.edx.14",0
d_0fh1edx15:		db	"	[-]		: Reserved.0f.1.edx.15",0
d_0fh1edx16:		db	"	[-]		: Reserved.0f.1.edx.16",0
d_0fh1edx17:		db	"	[-]		: Reserved.0f.1.edx.17",0
d_0fh1edx18:		db	"	[-]		: Reserved.0f.1.edx.18",0
d_0fh1edx19:		db	"	[-]		: Reserved.0f.1.edx.19",0
d_0fh1edx20:		db	"	[-]		: Reserved.0f.1.edx.20",0
d_0fh1edx21:		db	"	[-]		: Reserved.0f.1.edx.21",0
d_0fh1edx22:		db	"	[-]		: Reserved.0f.1.edx.22",0
d_0fh1edx23:		db	"	[-]		: Reserved.0f.1.edx.23",0
d_0fh1edx24:		db	"	[-]		: Reserved.0f.1.edx.24",0
d_0fh1edx25:		db	"	[-]		: Reserved.0f.1.edx.25",0
d_0fh1edx26:		db	"	[-]		: Reserved.0f.1.edx.26",0
d_0fh1edx27:		db	"	[-]		: Reserved.0f.1.edx.27",0
d_0fh1edx28:		db	"	[-]		: Reserved.0f.1.edx.28",0
d_0fh1edx29:		db	"	[-]		: Reserved.0f.1.edx.29",0
d_0fh1edx30:		db	"	[-]		: Reserved.0f.1.edx.30",0
d_0fh1edx31:		db	"	[-]		: Reserved.0f.1.edx.31",0
d_10h0:			db	"Intel Resource Director Technology (Intel RDT) Allocation Enumeration Sub-leaf:",0
d_10h0ebx:		db	1,0
d_10h0ebx00:		db	"	[-]		: Reserved.10.0.ebx.00",0
d_10h0ebx01:		db	"	[+]		: Supports L3 Cache Allocation Technology.",0
d_10h0ebx02:		db	"	[+]		: Supports L2 Cache Allocation Technology.",0
d_10h0ebx03:		db	"	[+]		: Supports Memory Bandwidth Allocation.",0
d_10h0ebx04:		db	"	[-]		: Reserved.10.0.ebx.04",0
d_10h0ebx05:		db	"	[-]		: Reserved.10.0.ebx.05",0
d_10h0ebx06:		db	"	[-]		: Reserved.10.0.ebx.06",0
d_10h0ebx07:		db	"	[-]		: Reserved.10.0.ebx.07",0
d_10h0ebx08:		db	"	[-]		: Reserved.10.0.ebx.08",0
d_10h0ebx09:		db	"	[-]		: Reserved.10.0.ebx.09",0
d_10h0ebx10:		db	"	[-]		: Reserved.10.0.ebx.10",0
d_10h0ebx11:		db	"	[-]		: Reserved.10.0.ebx.11",0
d_10h0ebx12:		db	"	[-]		: Reserved.10.0.ebx.12",0
d_10h0ebx13:		db	"	[-]		: Reserved.10.0.ebx.13",0
d_10h0ebx14:		db	"	[-]		: Reserved.10.0.ebx.14",0
d_10h0ebx15:		db	"	[-]		: Reserved.10.0.ebx.15",0
d_10h0ebx16:		db	"	[-]		: Reserved.10.0.ebx.16",0
d_10h0ebx17:		db	"	[-]		: Reserved.10.0.ebx.17",0
d_10h0ebx18:		db	"	[-]		: Reserved.10.0.ebx.18",0
d_10h0ebx19:		db	"	[-]		: Reserved.10.0.ebx.19",0
d_10h0ebx20:		db	"	[-]		: Reserved.10.0.ebx.20",0
d_10h0ebx21:		db	"	[-]		: Reserved.10.0.ebx.21",0
d_10h0ebx22:		db	"	[-]		: Reserved.10.0.ebx.22",0
d_10h0ebx23:		db	"	[-]		: Reserved.10.0.ebx.23",0
d_10h0ebx24:		db	"	[-]		: Reserved.10.0.ebx.24",0
d_10h0ebx25:		db	"	[-]		: Reserved.10.0.ebx.25",0
d_10h0ebx26:		db	"	[-]		: Reserved.10.0.ebx.26",0
d_10h0ebx27:		db	"	[-]		: Reserved.10.0.ebx.27",0
d_10h0ebx28:		db	"	[-]		: Reserved.10.0.ebx.28",0
d_10h0ebx29:		db	"	[-]		: Reserved.10.0.ebx.29",0
d_10h0ebx30:		db	"	[-]		: Reserved.10.0.ebx.30",0
d_10h0ebx31:		db	"	[-]		: Reserved.10.0.ebx.31",0
d_10h1:			db	"L3 Cache Allocation Technology Enumeration Sub-leaf:",0
d_10h1eax0004:		db	"]		: Length of the capacity bit mask for the corresponding ResID using minus-one notation.",0
d_10h1ebx0031:		db	"]	: Bit-granular map of isolation/contention of allocation units.",0
d_10h1ecx02:		db	"	[+]		: Code and Data Prioritization Technology supported.",0
d_10h1edx0015:		db	"]		: Highest COS number supported for this ResID.",0
d_10h2:			db	"L2 Cache Allocation Technology Enumeration Sub-leaf:",0
d_10h2eax0004:		db	"]		: Length of the capacity bit mask for the corresponding ResID using minus-one notation.",0
d_10h2ebx0031:		db	"]	: Bit-granular map of isolation/contention of allocation units.",0
d_10h2edx0015:		db	"]		: Highest COS number supported for this ResID.",0
d_10h3:			db	"Memory Bandwidth Allocation Enumeration Sub-leaf:",0
d_10h3eax0011:		db	"]		: Reports the maximum MBA throttling value supported for the corresponding ResID using minus-one notation.",0
d_10h3ecx02:		db	"	[+]		: Reports whether the response of the delay values is linear.",0
d_10h3edx0015:		db	"]		: Highest COS number supported for this ResID.",0
; Undefined	d_11h:			db	"Undefined.11h:",0
d_12h0:			db	"Intel SGX Capability Enumeration Leaf, sub-leaf 0:",0
d_12h0eax:		db	1,0
d_12h0eax00:		db	"	[+]		: SGX1. Indicates Intel SGX supports the collection of SGX1 leaf functions.",0
d_12h0eax01:		db	"	[+]		: SGX2. Indicates Intel SGX supports the collection of SGX2 leaf functions.",0
d_12h0eax02:		db	"	[-]		: Reserved.12.0.eax.02",0
d_12h0eax03:		db	"	[-]		: Reserved.12.0.eax.03",0
d_12h0eax04:		db	"	[-]		: Reserved.12.0.eax.04",0
d_12h0eax05:		db	"	[+]		: Indicates Intel SGX supports ENCLV instruction leaves EINCVIRTCHILD, EDECVIRTCHILD, and ESETCONTEXT.",0
d_12h0eax06:		db	"	[+]		: Indicates Intel SGX supports ENCLS instruction leaves ETRACKC, ERDINFO, ELDBC, and ELDUC.",0
d_12h0eax07:		db	"	[-]		: Reserved.12.0.eax.07",0
d_12h0eax08:		db	"	[-]		: Reserved.12.0.eax.08",0
d_12h0eax09:		db	"	[-]		: Reserved.12.0.eax.09",0
d_12h0eax10:		db	"	[-]		: Reserved.12.0.eax.10",0
d_12h0eax11:		db	"	[-]		: Reserved.12.0.eax.11",0
d_12h0eax12:		db	"	[-]		: Reserved.12.0.eax.12",0
d_12h0eax13:		db	"	[-]		: Reserved.12.0.eax.13",0
d_12h0eax14:		db	"	[-]		: Reserved.12.0.eax.14",0
d_12h0eax15:		db	"	[-]		: Reserved.12.0.eax.15",0
d_12h0eax16:		db	"	[-]		: Reserved.12.0.eax.16",0
d_12h0eax17:		db	"	[-]		: Reserved.12.0.eax.17",0
d_12h0eax18:		db	"	[-]		: Reserved.12.0.eax.18",0
d_12h0eax19:		db	"	[-]		: Reserved.12.0.eax.19",0
d_12h0eax20:		db	"	[-]		: Reserved.12.0.eax.20",0
d_12h0eax21:		db	"	[-]		: Reserved.12.0.eax.21",0
d_12h0eax22:		db	"	[-]		: Reserved.12.0.eax.22",0
d_12h0eax23:		db	"	[-]		: Reserved.12.0.eax.23",0
d_12h0eax24:		db	"	[-]		: Reserved.12.0.eax.24",0
d_12h0eax25:		db	"	[-]		: Reserved.12.0.eax.25",0
d_12h0eax26:		db	"	[-]		: Reserved.12.0.eax.26",0
d_12h0eax27:		db	"	[-]		: Reserved.12.0.eax.27",0
d_12h0eax28:		db	"	[-]		: Reserved.12.0.eax.28",0
d_12h0eax29:		db	"	[-]		: Reserved.12.0.eax.29",0
d_12h0eax30:		db	"	[-]		: Reserved.12.0.eax.30",0
d_12h0eax31:		db	"	[-]		: Reserved.12.0.eax.31",0
d_12h0ebx0031:		db	"]	: MISCSELECT. Bit vector of supported extended SGX features.",0
d_12h0edx0007:		db	"]		: MaxEnclaveSize_Not64. The maximum supported enclave size in non-64-bit mode is 2^.",0
d_12h0edx0815:		db	"]		: MaxEnclaveSize_64. The maximum supported enclave size in 64-bit mode is 2^.",0
d_12h1:			db	"Intel SGX Attributes Enumeration Leaf, sub-leaf 1:",0
d_12h1eax0031:		db	"]	: Reports the valid bits of SECS.ATTRIBUTES[31:0] that software can set with ECREATE.",0
d_12h1ebx0031:		db	"]	: Reports the valid bits of SECS.ATTRIBUTES[63:32] that software can set with ECREATE.",0
d_12h1ecx0031:		db	"]	: Reports the valid bits of SECS.ATTRIBUTES[95:64] that software can set with ECREATE.",0
d_12h1edx0031:		db	"]	: Reports the valid bits of SECS.ATTRIBUTES[127:96] that software can set with ECREATE.",0
d_12h2:			db	"Intel SGX EPC Enumeration Leaf, sub-leaves:",0
d_12h2eax00030:		db	"	[0]		: Indicates this sub-leaf is invalid.",0
d_12h2eax00031:		db	"	[1]		: This sub-leaf enumerates an EPC section. Provide information on the Enclave Page Cache (EPC) section.",0
d_12h2eax0003x:		db	"	[x]		: All other type encodings are reserved.",0
d_12h2eax1231:		db	"]	: The physical address of the base of the EPC section.",0
d_12h2ebx0019:		db	"]	: The physical address of the base of the EPC section.",0
d_12h2ecx00030:		db	"	[0]		: All bits of the EDX:ECX pair are enumerated as 0.",0
d_12h2ecx00031:		db	"	[1]		: This section has confidentiality and integrity protection.",0
d_12h2ecx0003x:		db	"	[x]		: All other encodings are reserved.",0
d_12h2ecx1231:		db	"]	: The size of the corresponding EPC section within the Processor Reserved Memory.",0
d_12h2edx0019:		db	"]	: The size of the corresponding EPC section within the Processor Reserved Memory.",0
; Undefined	d_13h:			db	"Undefined.13h:",0
d_14h0:			db	"Intel Processor Trace Enumeration Main Leaf:",0
d_14h0eax0031:		db	"]	: Reports the maximum sub-leaf supported in leaf.",0
d_14h0ebx:		db	1,0
d_14h0ebx00:		db	"	[+]		: Indicates that IA32_RTIT_CTL.CR3Filter can be set to 1, and that IA32_RTIT_CR3_MATCH MSR can be accessed.",0
d_14h0ebx01:		db	"	[+]		: Indicates support of Configurable PSB and Cycle-Accurate Mode.",0
d_14h0ebx02:		db	"	[+]		: Indicates support of IP Filtering, TraceStop filtering, and preservation of Intel PT MSRs across warm reset.",0
d_14h0ebx03:		db	"	[+]		: Indicates support of MTC timing packet and suppression of COFI-based packets.",0
d_14h0ebx04:		db	"	[+]		: Indicates support of PTWRITE. Writes can set IA32_RTIT_CTL[12] (PTWEn) and IA32_RTIT_CTL[5] (FUPonPTW), and PTWRITE can generate packets.",0
d_14h0ebx05:		db	"	[+]		: Indicates support of Power Event Trace. Writes can set IA32_RTIT_CTL[4] (PwrEvtEn), enabling Power Event Trace packet generation.",0
d_14h0ebx06:		db	"	[-]		: Reserved.14.0.ebx.06",0
d_14h0ebx07:		db	"	[-]		: Reserved.14.0.ebx.07",0
d_14h0ebx08:		db	"	[-]		: Reserved.14.0.ebx.08",0
d_14h0ebx09:		db	"	[-]		: Reserved.14.0.ebx.09",0
d_14h0ebx10:		db	"	[-]		: Reserved.14.0.ebx.10",0
d_14h0ebx11:		db	"	[-]		: Reserved.14.0.ebx.11",0
d_14h0ebx12:		db	"	[-]		: Reserved.14.0.ebx.12",0
d_14h0ebx13:		db	"	[-]		: Reserved.14.0.ebx.13",0
d_14h0ebx14:		db	"	[-]		: Reserved.14.0.ebx.14",0
d_14h0ebx15:		db	"	[-]		: Reserved.14.0.ebx.15",0
d_14h0ebx16:		db	"	[-]		: Reserved.14.0.ebx.16",0
d_14h0ebx17:		db	"	[-]		: Reserved.14.0.ebx.17",0
d_14h0ebx18:		db	"	[-]		: Reserved.14.0.ebx.18",0
d_14h0ebx19:		db	"	[-]		: Reserved.14.0.ebx.19",0
d_14h0ebx20:		db	"	[-]		: Reserved.14.0.ebx.20",0
d_14h0ebx21:		db	"	[-]		: Reserved.14.0.ebx.21",0
d_14h0ebx22:		db	"	[-]		: Reserved.14.0.ebx.22",0
d_14h0ebx23:		db	"	[-]		: Reserved.14.0.ebx.23",0
d_14h0ebx24:		db	"	[-]		: Reserved.14.0.ebx.24",0
d_14h0ebx25:		db	"	[-]		: Reserved.14.0.ebx.25",0
d_14h0ebx26:		db	"	[-]		: Reserved.14.0.ebx.26",0
d_14h0ebx27:		db	"	[-]		: Reserved.14.0.ebx.27",0
d_14h0ebx28:		db	"	[-]		: Reserved.14.0.ebx.28",0
d_14h0ebx29:		db	"	[-]		: Reserved.14.0.ebx.29",0
d_14h0ebx30:		db	"	[-]		: Reserved.14.0.ebx.30",0
d_14h0ebx31:		db	"	[-]		: Reserved.14.0.ebx.31",0
d_14h0ecx:		db	1,0
d_14h0ecx00:		db	"	[+]		: Tracing can be enabled with IA32_RTIT_CTL.ToPA = 1, hence utilizing the ToPA output scheme; IA32_RTIT_OUTPUT_BASE and IA32_RTIT_OUTPUT_MASK_PTRS MSRs can be accessed.",0
d_14h0ecx01:		db	"	[+]		: ToPA tables can hold any number of output entries, up to the maximum allowed by the MaskOrTableOffset field of IA32_RTIT_OUTPUT_MASK_PTRS.",0
d_14h0ecx02:		db	"	[+]		: Indicates support of Single-Range Output scheme.",0
d_14h0ecx03:		db	"	[+]		: Indicates support of output to Trace Transport subsystem.",0
d_14h0ecx04:		db	"	[-]		: Reserved.14.0.ecx.04",0
d_14h0ecx05:		db	"	[-]		: Reserved.14.0.ecx.05",0
d_14h0ecx06:		db	"	[-]		: Reserved.14.0.ecx.06",0
d_14h0ecx07:		db	"	[-]		: Reserved.14.0.ecx.07",0
d_14h0ecx08:		db	"	[-]		: Reserved.14.0.ecx.08",0
d_14h0ecx09:		db	"	[-]		: Reserved.14.0.ecx.09",0
d_14h0ecx10:		db	"	[-]		: Reserved.14.0.ecx.10",0
d_14h0ecx11:		db	"	[-]		: Reserved.14.0.ecx.11",0
d_14h0ecx12:		db	"	[-]		: Reserved.14.0.ecx.12",0
d_14h0ecx13:		db	"	[-]		: Reserved.14.0.ecx.13",0
d_14h0ecx14:		db	"	[-]		: Reserved.14.0.ecx.14",0
d_14h0ecx15:		db	"	[-]		: Reserved.14.0.ecx.15",0
d_14h0ecx16:		db	"	[-]		: Reserved.14.0.ecx.16",0
d_14h0ecx17:		db	"	[-]		: Reserved.14.0.ecx.17",0
d_14h0ecx18:		db	"	[-]		: Reserved.14.0.ecx.18",0
d_14h0ecx19:		db	"	[-]		: Reserved.14.0.ecx.19",0
d_14h0ecx20:		db	"	[-]		: Reserved.14.0.ecx.20",0
d_14h0ecx21:		db	"	[-]		: Reserved.14.0.ecx.21",0
d_14h0ecx22:		db	"	[-]		: Reserved.14.0.ecx.22",0
d_14h0ecx23:		db	"	[-]		: Reserved.14.0.ecx.23",0
d_14h0ecx24:		db	"	[-]		: Reserved.14.0.ecx.24",0
d_14h0ecx25:		db	"	[-]		: Reserved.14.0.ecx.25",0
d_14h0ecx26:		db	"	[-]		: Reserved.14.0.ecx.26",0
d_14h0ecx27:		db	"	[-]		: Reserved.14.0.ecx.27",0
d_14h0ecx28:		db	"	[-]		: Reserved.14.0.ecx.28",0
d_14h0ecx29:		db	"	[-]		: Reserved.14.0.ecx.29",0
d_14h0ecx30:		db	"	[-]		: Reserved.14.0.ecx.30",0
d_14h0ecx31:		db	"	[+]		: Generated packets which contain IP payloads have LIP values, which include the CS base component.",0
d_14h1:			db	"Intel Processor Trace Enumeration Sub-leaf:",0
d_14h1eax0002:		db	"]		: Number of configurable Address Ranges for filtering.",0
d_14h1eax1631:		db	"]		: Bitmap of supported MTC period encodings.",0
d_14h1ebx0015:		db	"]		: Bitmap of supported Cycle Threshold value encodings.",0
d_14h1ebx1631:		db	"]		: Bitmap of supported Configurable PSB frequency encodings.",0
d_15h:			db	"Time Stamp Counter and Nominal Core Crystal Clock Information Leaf:",0
d_15heax0031:		db	"]	: An unsigned integer which is the denominator of the TSC/”core crystal clock” ratio.",0
d_15hebx0031:		db	"]	: An unsigned integer which is the numerator of the TSC/”core crystal clock” ratio.",0
d_15hecx0031:		db	"]	: An unsigned integer which is the nominal frequency of the core crystal clock in Hz.",0
d_16h:			db	"Processor Frequency Information Leaf:",0
d_16heax0015:		db	"]		: Processor Base Frequency (in MHz).",0
d_16hebx0015:		db	"]		: Maximum Frequency (in MHz).",0
d_16hecx0015:		db	"]		: Bus (Reference) Frequency (in MHz).",0
d_16hn:			db	"			: (Data is returned from this interface in accordance with the processor's specification and does not reflect actual values. Suitable use of this data includes the display of processor information in like manner to the processor brand string and for determining the appropriate range to use when displaying processor information e.g. frequency history graphs. The returned information should not be used for any other purpose as the returned information does not accurately correlate to information / counters returned by other processor interfaces. While a processor may support the Processor Frequency Information leaf, fields that return a value of zero are not supported.)",0
d_17h0:			db	"System-On-Chip Vendor Attribute Enumeration Main Leaf:",0
d_17h0eax0031:		db	"]	: MaxSOCID_Index. Reports the maximum input value of supported sub-leaf in leaf 17H.",0
d_17h0ebx0015:		db	"]		: SOC Vendor ID.",0
d_17h0ebx16:		db	"	[+]	: IsVendorScheme. The SOC Vendor ID field is assigned via an industry standard enumeration scheme. Otherwise, the SOC Vendor ID field is assigned by Intel.",0
d_17h0ecx0031:		db	"]	: Project ID. A unique number an SOC vendor assigns to its SOC projects.",0
d_17h0edx0031:		db	"]	: Stepping ID. A unique number within an SOC project that an SOC vendor assigns.",0
d_17h1:			db	"System-On-Chip Vendor Attribute Enumeration Sub-leaf:",0
; Reserved	d_17h4:			db	"Undefined.17h4:",0
d_18h0:			db	"Deterministic Address Translation Parameters Main Leaf:",0
d_18h0eax0031:		db	"]	: Reports the maximum input value of supported sub-leaf in leaf 18H.",0
d_18h0ebx00:		db	"	[+]		: 4K page size entries supported by this structure.",0
d_18h0ebx01:		db	"	[+]		: 2MB page size entries supported by this structure.",0
d_18h0ebx02:		db	"	[+]		: 4MB page size entries supported by this structure.",0
d_18h0ebx03:		db	"	[+]		: 1 GB page size entries supported by this structure.",0
d_18h0ebx0810:		db	"]		: Partitioning (0: Soft partitioning between the logical processors sharing this structure).",0
d_18h0ebx1631:		db	"]		: W = Ways of associativity.",0
d_18h0ecx0031:		db	"]	: Number of Sets.",0
d_18h0edx00040:		db	"]		: Null (indicates this sub-leaf is not valid).",0
d_18h0edx00041:		db	"]		: Data TLB.",0
d_18h0edx00042:		db	"]		: Instruction TLB.",0
d_18h0edx00043:		db	"]		: Unified TLB.(Some unified TLBs will allow a single TLB entry to satisfy data read/write and instruction fetches. Others will require separate entries (e.g., one loaded on data read/write and another loaded on an instruction fetch) . Please see the Intel® 64 and IA-32 Architectures Optimization Reference Manual for details of a particular product.)",0
d_18h0edx0004x:		db	"]		: All other encodings are reserved.",0
d_18h0edx0507:		db	"]		: Translation cache level (starts at 1).",0
d_18h0edx08:		db	"	[+]		: Fully associative structure.",0
d_18h0edx1425:		db	"]		: Maximum number of addressable IDs for logical processors sharing this translation cache.",0
d_18h1:			db	"Deterministic Address Translation Parameters Sub-leaf:",0
d_80_title:			db	"------------- ---- ------",DISP_NL
			db	"Extended Function CPUID Information:",0
d_80heax0031:		db	"]	: Maximum Input Value for Extended Function CPUID Information.",0
d_81heax0031:		db	"]	: Extended Processor Signature and Feature Bits.",0
d_81hecx:		db	1,0
d_81hecx00:		db	"	[+]		: LAHF/SAHF available in 64-bit mode.",0
d_81hecx01:		db	"	[-]		: Reserved.81.ecx.01",0
d_81hecx02:		db	"	[-]		: Reserved.81.ecx.02",0
d_81hecx03:		db	"	[-]		: Reserved.81.ecx.03",0
d_81hecx04:		db	"	[-]		: Reserved.81.ecx.04",0
d_81hecx05:		db	"	[+]		: LZCNT.",0
d_81hecx06:		db	"	[-]		: Reserved.81.ecx.06",0
d_81hecx07:		db	"	[-]		: Reserved.81.ecx.07",0
d_81hecx08:		db	"	[+]		: PREFETCHW.",0
d_81hecx09:		db	"	[-]		: Reserved.81.ecx.09",0
d_81hecx10:		db	"	[-]		: Reserved.81.ecx.10",0
d_81hecx11:		db	"	[-]		: Reserved.81.ecx.11",0
d_81hecx12:		db	"	[-]		: Reserved.81.ecx.12",0
d_81hecx13:		db	"	[-]		: Reserved.81.ecx.13",0
d_81hecx14:		db	"	[-]		: Reserved.81.ecx.14",0
d_81hecx15:		db	"	[-]		: Reserved.81.ecx.15",0
d_81hecx16:		db	"	[-]		: Reserved.81.ecx.16",0
d_81hecx17:		db	"	[-]		: Reserved.81.ecx.17",0
d_81hecx18:		db	"	[-]		: Reserved.81.ecx.18",0
d_81hecx19:		db	"	[-]		: Reserved.81.ecx.19",0
d_81hecx20:		db	"	[-]		: Reserved.81.ecx.20",0
d_81hecx21:		db	"	[-]		: Reserved.81.ecx.21",0
d_81hecx22:		db	"	[-]		: Reserved.81.ecx.22",0
d_81hecx23:		db	"	[-]		: Reserved.81.ecx.23",0
d_81hecx24:		db	"	[-]		: Reserved.81.ecx.24",0
d_81hecx25:		db	"	[-]		: Reserved.81.ecx.25",0
d_81hecx26:		db	"	[-]		: Reserved.81.ecx.26",0
d_81hecx27:		db	"	[-]		: Reserved.81.ecx.27",0
d_81hecx28:		db	"	[-]		: Reserved.81.ecx.28",0
d_81hecx29:		db	"	[-]		: Reserved.81.ecx.29",0
d_81hecx30:		db	"	[-]		: Reserved.81.ecx.30",0
d_81hecx31:		db	"	[-]		: Reserved.81.ecx.31",0
d_81hedx:		db	1,0
d_81hedx00:		db	"	[-]		: Reserved.81.edx.00",0
d_81hedx01:		db	"	[-]		: Reserved.81.edx.01",0
d_81hedx02:		db	"	[-]		: Reserved.81.edx.02",0
d_81hedx03:		db	"	[-]		: Reserved.81.edx.03",0
d_81hedx04:		db	"	[-]		: Reserved.81.edx.04",0
d_81hedx05:		db	"	[-]		: Reserved.81.edx.05",0
d_81hedx06:		db	"	[-]		: Reserved.81.edx.06",0
d_81hedx07:		db	"	[-]		: Reserved.81.edx.07",0
d_81hedx08:		db	"	[-]		: Reserved.81.edx.08",0
d_81hedx09:		db	"	[-]		: Reserved.81.edx.09",0
d_81hedx10:		db	"	[-]		: Reserved.81.edx.10",0
d_81hedx11:		db	"	[+]		: SYSCALL/SYSRET available in 64-bit mode.",0
d_81hedx12:		db	"	[-]		: Reserved.81.edx.12",0
d_81hedx13:		db	"	[-]		: Reserved.81.edx.13",0
d_81hedx14:		db	"	[-]		: Reserved.81.edx.14",0
d_81hedx15:		db	"	[-]		: Reserved.81.edx.15",0
d_81hedx16:		db	"	[-]		: Reserved.81.edx.16",0
d_81hedx17:		db	"	[-]		: Reserved.81.edx.17",0
d_81hedx18:		db	"	[-]		: Reserved.81.edx.18",0
d_81hedx19:		db	"	[-]		: Reserved.81.edx.19",0
d_81hedx20:		db	"	[+]		: Execute Disable Bit available.",0
d_81hedx21:		db	"	[-]		: Reserved.81.edx.21",0
d_81hedx22:		db	"	[-]		: Reserved.81.edx.22",0
d_81hedx23:		db	"	[-]		: Reserved.81.edx.23",0
d_81hedx24:		db	"	[-]		: Reserved.81.edx.24",0
d_81hedx25:		db	"	[-]		: Reserved.81.edx.25",0
d_81hedx26:		db	"	[+]		: 1-GByte pages are available.",0
d_81hedx27:		db	"	[+]		: RDTSCP and IA32_TSC_AUX are available.",0
d_81hedx28:		db	"	[-]		: Reserved.81.edx.28",0
d_81hedx29:		db	"	[+]		: Intel ® 64 Architecture available.",0
d_81hedx30:		db	"	[-]		: Reserved.81.edx.30",0
d_81hedx31:		db	"	[-]		: Reserved.81.edx.31",0
d_82h84h:		db	"]	: Processor Brand String.",0
; Reserved	d_85h:			db	"Undefined.80000005h:",0
d_86hecx0007:		db	"]		: Cache Line size in bytes.",0
d_86hecx1215:		db	"]		: L2 Associativity field.",0
d_86hecx1631:		db	"]		: Cache size in 1K units.",0
d_87hedx:		db	1,0
d_87hedx00:		db	"	[-]		: Reserved.87.edx.00",0
d_87hedx01:		db	"	[-]		: Reserved.87.edx.01",0
d_87hedx02:		db	"	[-]		: Reserved.87.edx.02",0
d_87hedx03:		db	"	[-]		: Reserved.87.edx.03",0
d_87hedx04:		db	"	[-]		: Reserved.87.edx.04",0
d_87hedx05:		db	"	[-]		: Reserved.87.edx.05",0
d_87hedx06:		db	"	[-]		: Reserved.87.edx.06",0
d_87hedx07:		db	"	[-]		: Reserved.87.edx.07",0
d_87hedx08:		db	"	[+]		: Invariant TSC available.",0
d_87hedx09:		db	"	[-]		: Reserved.87.edx.09",0
d_87hedx10:		db	"	[-]		: Reserved.87.edx.10",0
d_87hedx11:		db	"	[-]		: Reserved.87.edx.11",0
d_87hedx12:		db	"	[-]		: Reserved.87.edx.12",0
d_87hedx13:		db	"	[-]		: Reserved.87.edx.13",0
d_87hedx14:		db	"	[-]		: Reserved.87.edx.14",0
d_87hedx15:		db	"	[-]		: Reserved.87.edx.15",0
d_87hedx16:		db	"	[-]		: Reserved.87.edx.16",0
d_87hedx17:		db	"	[-]		: Reserved.87.edx.17",0
d_87hedx18:		db	"	[-]		: Reserved.87.edx.18",0
d_87hedx19:		db	"	[-]		: Reserved.87.edx.19",0
d_87hedx20:		db	"	[-]		: Reserved.87.edx.20",0
d_87hedx21:		db	"	[-]		: Reserved.87.edx.21",0
d_87hedx22:		db	"	[-]		: Reserved.87.edx.22",0
d_87hedx23:		db	"	[-]		: Reserved.87.edx.23",0
d_87hedx24:		db	"	[-]		: Reserved.87.edx.24",0
d_87hedx25:		db	"	[-]		: Reserved.87.edx.25",0
d_87hedx26:		db	"	[-]		: Reserved.87.edx.26",0
d_87hedx27:		db	"	[-]		: Reserved.87.edx.27",0
d_87hedx28:		db	"	[-]		: Reserved.87.edx.28",0
d_87hedx29:		db	"	[-]		: Reserved.87.edx.29",0
d_87hedx30:		db	"	[-]		: Reserved.87.edx.30",0
d_87hedx31:		db	"	[-]		: Reserved.87.edx.31",0
d_88heax0007:		db	"]		: #Physical Address Bits. (Address size)",0
d_88heax0815:		db	"]		: #Linear Address Bits. (Address size)",0
d_ext00:		db	"------------- ---- ------",DISP_NL
			db	"[ext-00]",0
d_dfdm:			db	00h,0
d_dfdm_01:		db	01h,06,03h,06h,05h,06h,06h,06h,07h,06h,08h,06h,0ah,06h,0bh,06h,01h,0
d_dfdm_02:		db	00h,0fh,01h,0fh,02h,0fh,03h,0fh,04h,0fh,06h,0fh,02h,0
d_dfdm_03:		db	09h,06h,0dh,06h,03h,0
d_dfdm_04:		db	03h,0fh,04h,0fh,04h,0
d_dfdm_05:		db	0eh,06h,05h,0
d_dfdm_06:		db	0fh,06h,06h,0
d_dfdm_07:		db	17h,06h,07h,0
d_dfdm_08:		db	1dh,06h,08h,0
d_dfdm_09:		db	1ch,06h,26h,06h,27h,06h,35h,06h,36h,06h,09h,0
d_dfdm_0a:		db	37h,06h,4ah,06h,4dh,06h,5ah,06h,5dh,06h,4ch,06h,0ah,0
d_dfdm_0b:		db	5ch,06h,5fh,06h,0bh,0
d_dfdm_0c:		db	1ah,06h,1eh,06h,1fh,06h,25h,06h,2ch,06h,2eh,06h,2fh,06h,0ch,0
d_dfdm_0d:		db	2ah,06h,2dh,06h,3ah,06h,3eh,06h,0dh,0
d_dfdm_0e:		db	3ch,06h,45h,06h,46h,06h,3fh,06h,3dh,06h,47h,06h,4fh,06h,56h,06h,4eh,06h,5eh,06h,0eh,0
d_dfdm_xx:		db	0ffh,0
d_pf:			db	"Undefined",0
d_pf_01:		db	"P6",0
d_pf_02:		db	"Processors Based on Intel NetBurst microarchitecture (No L3)",0
d_pf_03:		db	"Pentium M processors",0
d_pf_04:		db	"Processors Based on Intel NetBurst microarchitecture (No L3)",0
d_pf_05:		db	"Intel ® CoreTM Solo and Intel ® CoreTM Duo processors, Dual-core Intel ® Xeon ® processor LV",0
d_pf_06:		db	"Intel ® CoreTM2 Duo processor, Intel Xeon processor 3000, 5100, 5300, 7300 Series - general-purpose PMC",0
d_pf_07:		db	"Intel ® CoreTM2 Duo processor family, Intel Xeon processor 3100, 3300, 5200, 5400 series - general-purpose PMC",0
d_pf_08:		db	"Intel Xeon processors 7400 series",0
d_pf_09:		db	"45 nm and 32 nm Intel ® AtomTM processors",0
d_pf_0a:		db	"Intel ® AtomTM processors based on Silvermont or Airmont microarchitectures",0
d_pf_0b:		db	"Next Generation Intel ® AtomTM processors based on Goldmont microarchitecture",0
d_pf_0c:		db	"Intel ® processors based on the Nehalem, Westmere microarchitectures",0
d_pf_0d:		db	"Intel ® processors based on the Sandy Bridge, Ivy Bridge microarchitecture",0
d_pf_0e:		db	"Intel ® processors based on the Haswell, Broadwell, SkyLake microarchitectures",0
d_pf_xx:		db	"Reserved",0
;
;	} data
;
; off	GPLv3+:				; GPLv3+ {
	db	"DavydovMA GPLv3+"	; } GPLv3+;


%endif					; ASM_CPUID_INTEL_DATA {
; } DavydovMA 2020011900