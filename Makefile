# Locations and targets.
TARGET_OS = linux
TARGET_ARCH = amd64
PREFIX    = /usr/local
DESTDIR   =
SRCDIR   := source
HDIR     := source/headers
SYSHDIR  := source/headers
TSTDIR   := test

# Compilers and its flags.
VC      = v
AR      = ar
ARFLAGS =
VFLAGS  =

VHARDFLAGS := $(VFLAGS) -os $(TARGET_OS) -d $(TARGET_ARCH)
ARHARDFLAGS := $(ARFLAGS) rcs

CRT  := crt0.o
LIBC := libc.a
LIBM := libm.a

.PHONY: all install-headers install clean

all: $(CRT) $(LIBC) $(LIBM)

$(CRT):
	@echo "Building $(CRT)"
	@$(VC) $(VHARDFLAGS) $(SRCDIR)/crt -o $(CRT)

$(LIBC):
	@echo "Building $(LIBC)"
	@$(VC) $(VHARDFLAGS) $(SRCDIR)/libc -o $(LIBC).o
	@$(AR) $(ARHARDFLAGS) $(LIBC) $(LIBC).o
	@rm $(LIBC).o

$(LIBM):
	@echo "Building $(LIBM)"
	@$(VC) $(VHARDFLAGS) $(SRCDIR)/libm -o $(LIBM).o
	@$(AR) $(ARHARDFLAGS) $(LIBM) $(LIBM).o
	@rm $(LIBM).o

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
