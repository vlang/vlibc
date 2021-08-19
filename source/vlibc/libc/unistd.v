module libc

[export: '_exit']
[noreturn]
pub fn immediate_exit2(status int) {
	immediate_exit(status)
}
