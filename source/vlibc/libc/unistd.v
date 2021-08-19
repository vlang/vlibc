module libc

[export: '_exit']
[noreturn]
pub fn immediate_exit2(status C.int) {
	immediate_exit(status)
}
