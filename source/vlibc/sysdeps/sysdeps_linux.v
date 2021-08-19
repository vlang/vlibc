module sysdeps

[noreturn]
pub fn sys_exit(code C.int) {
	asm volatile amd64 {
		syscall
		;; a(60) D(code) ; rcx r11 memory
	}
	for {}
}
