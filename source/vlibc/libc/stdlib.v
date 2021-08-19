module libc

import sysdeps

const exit_success = 0
const exit_failure = 1

[export: 'abort']
[noreturn]
pub fn abort() {
	sysdeps.sys_exit(exit_failure)
}

[export: 'exit']
[noreturn]
pub fn c_exit(status int) {
	// TODO: Call functions added with atexit after we have malloc to register
	// them on a dynarray.
	sysdeps.sys_exit(status)
}

[export: '_Exit']
[noreturn]
pub fn immediate_exit(status int) {
	sysdeps.sys_exit(status)
}
