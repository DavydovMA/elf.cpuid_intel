# mAdavydov 2013040600 {
#
# MAKEFILE_FILE		"Makefile"
# MAKEFILE_NAME		"Makefile"
# MAKEFILE_VERSION	"20.01"
# MAKEFILE_COPYRIGHT	"Copyright 1990-2020"
# MAKEFILE_AUTHOR	"DavydovMA"
# MAKEFILE_URL		"http://domain"
# MAKEFILE_EMAIL	"dev-asm@domain"

SOFT=cpuid_intel

# ------------- ---- ------
.PHONY: all clean install uninstall debug
#
# DavydovMA GPLv3+
#
ASM_x64		=nasm
ASM_x32		=nasm
#
FLAGS_ARCH	= $(shell uname -m | sed s,i[3456789]86,x86_32,)
FLAGS_ELF32	= -f elf32 -O0 -s -d x86_32 -d OS_GNU
FLAGS_ELF64	= -f elf64 -O0 -s -d x86_64 -d OS_GNU
#
LINK=ld -x
#
EXT_ELF32=.lx86_32.elf
EXT_ELF64=.lx86_64.elf
# ------------- ---- ------
ifeq ($(FLAGS_ARCH),x86_32)
	ASM=$(ASM_x32)
	FLAGS=$(FLAGS_ELF32)
	EXT=$(EXT_ELF32)
endif
ifeq ($(FLAGS_ARCH),x86_64)
	ASM=$(ASM_x64)
	FLAGS=$(FLAGS_ELF64)
	EXT=$(EXT_ELF64)
endif

all:	all_elf all_man1
#	see top
all_elf:
	$(ASM) $(FLAGS) cpuid_intel.asm -o $(SOFT).o -l $(SOFT).lst
	$(LINK) $(SOFT).o -o $(SOFT)$(EXT)
all_man1:
	gzip -k -f ./man/man1/$(SOFT).1
	gzip -k -f ./man/ru/man1/$(SOFT).1

clean:	clean_elf clean_o clean_lst clean_man1
#	see top
clean_o:
	rm -v -f $(SOFT)*.o
clean_elf:
	rm -v -f $(SOFT)*.elf
clean_lst:
	rm -v -f $(SOFT)*.lst
clean_man1:
	rm -v -f ./man/man1/$(SOFT).1.gz
	rm -v -f ./man/ru/man1/$(SOFT).1.gz

install:	install_elf install_man1
#	see top
install_elf:
	mkdir -v -p /usr/local/bin/DavydovMA
	cp -v -f $(SOFT)$(EXT) /usr/local/bin/DavydovMA
	ln -s -f /usr/local/bin/DavydovMA/$(SOFT)$(EXT) /usr/bin/$(SOFT)
install_man1:
	cp -v -f ./man/man1/$(SOFT).1.gz    /usr/share/man/man1
	cp -v -f ./man/ru/man1/$(SOFT).1.gz /usr/share/man/ru/man1

uninstall:	uninstall_elf uninstall_man1
#	see top
uninstall_elf:
	rm -v -f /usr/bin/$(SOFT)
	rm -v -f /usr/local/bin/DavydovMA/$(SOFT)$(EXT)
uninstall_man1:
	rm -v -f /usr/share/man/ru/man1/$(SOFT).1.gz
	rm -v -f /usr/share/man/man1/$(SOFT).1.gz

debug:
	@echo "Not use..."


# } DavydovMA 2020011800