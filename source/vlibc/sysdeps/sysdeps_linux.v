module sysdeps

const mmap_prot_none = 0
const mmap_prot_read = 1
const mmap_prot_write = 2
const mmap_prot_exec = 4
const mmap_prot_growsdown = 0x01000000
const mmap_prot_growsup = 0x02000000

const mmap_map_type = 0x0f
const mmap_map_file = 0x00
const mmap_map_anon = 0x20
const mmap_map_noreserve = 0x4000
const mmap_map_growsdown = 0x0100
const mmap_map_denywrite = 0x0800
const mmap_map_executable = 0x1000
const mmap_map_locked = 0x2000
const mmap_map_populate = 0x8000
const mmap_map_nonblock = 0x10000
const mmap_map_stack = 0x20000
const mmap_map_hugetlb = 0x40000

[noreturn]
pub fn sys_exit(code C.int) {
	asm volatile amd64 {
		syscall
		;; a(60) D(code) ; rcx r11 memory
	}
	for {}
}

pub fn sys_mmap(addr voidptr, length u64, prot int, flag int, fd int, offset int) voidptr {
	mut ret := voidptr(0)
	asm volatile amd64 {
		mov r10, flag
		mov r8, fd
		mov r9, offset
		syscall
		; =a(ret) ; a(9) D(addr) S(length) d(prot) m(flag) m(fd) m(offset); rcx r11 memory
	}
	return ret
}

pub fn sys_munmap(addr voidptr, length u64) int {
	mut ret := 0
	asm volatile amd64 {
		syscall
		; =a(ret) ; a(9) D(addr) S(length); rcx r11 memory
	}
	return ret
}
