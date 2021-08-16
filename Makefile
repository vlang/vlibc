# Locations and targets.
TARGET_OS = linux
TARGET_ARCH = amd64
PREFIX    = /usr/local
DESTDIR   =
SRCDIR   := source
HDIR     := source/headers
SYSHDIR  := source/headers-sysdeps

# Compilers and its flags.
VC      = v
CC      = cc
AS      = cc
AR      = ar
VFLAGS  =
CFLAGS  =
ASFLAGS =
ARFLAGS =

VHARDFLAGS := $(VFLAGS) -os $(TARGET_OS) -d $(TARGET_ARCH)
CHARDFLAGS := $(CFLAGS) -ffreestanding -fno-stack-protector -fdata-sections -ffunction-sections
ASHARDFLAGS := $(ASFLAGS) -ffreestanding
ARHARDFLAGS := $(ARFLAGS) rcs

CRT  := crt0.o
LIBC := libc.a
LIBM := libm.a

.PHONY: all install-headers install clean

all: $(CRT) $(LIBC) $(LIBM)

$(CRT):
	@echo "Building $(CRT)"
	@$(AS) $(ASHARDFLAGS) -c $(SRCDIR)/crt/crt0-$(TARGET_OS)-$(TARGET_ARCH).S -o $(CRT)

$(LIBC):
	@echo "Building $(LIBC)"
	@$(VC) $(VHARDFLAGS) $(SRCDIR)/vlibc -o $(LIBC).c
	@sed -i 's/int main(int ___argc/static int ___delete____(int ___argc/g' $(LIBC).c
	@$(CC) $(CHARDFLAGS) -c $(LIBC).c -o $(LIBC).o
	@$(AR) $(ARHARDFLAGS) $(LIBC) $(LIBC).o
	@rm $(LIBC).c $(LIBC).o

$(LIBM):
	@echo "Building $(LIBM)"
	@touch a.S
	@$(AS) $(ASHARDFLAGS) -c a.S -o $(LIBM).o
	@$(AR) $(ARHARDFLAGS) $(LIBM) $(LIBM).o
	@rm $(LIBM).o a.S

install-headers:
	install -d "$(DESTDIR)$(PREFIX)/include/sys"
	cp -rL $(HDIR)/*    "$(DESTDIR)$(PREFIX)/include"
	cp -rL $(SYSHDIR)/* "$(DESTDIR)$(PREFIX)/include/sys"

install: install-headers all
	install -d "$(DESTDIR)$(PREFIX)/lib"
	install -m 644 $(CRT)  "$(DESTDIR)$(PREFIX)/lib/"
	install -m 644 $(LIBC) "$(DESTDIR)$(PREFIX)/lib/"
	install -m 644 $(LIBM) "$(DESTDIR)$(PREFIX)/lib/"

clean:
	rm -f $(CRT) $(LIBC) $(LIBM)
