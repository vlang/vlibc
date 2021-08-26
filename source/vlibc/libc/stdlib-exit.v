module libc

import sysdeps

const exit_success = 0
const exit_failure = 1

// TODO: Lock the atexit registration of functions for MT-safety.

__global(
	atexit_list []fn()
)

[export: 'abort']
[noreturn]
pub fn abort() {
	sysdeps.sys_exit(C.int(exit_failure))
}

[export: 'exit']
[noreturn]
pub fn c_exit(status C.int) {
	for callback in atexit_list {
		callback()
	}
	sysdeps.sys_exit(status)
}

[export: '_Exit']
[noreturn]
pub fn immediate_exit(status C.int) {
	sysdeps.sys_exit(status)
}

[export: 'atexit']
pub fn atexit(callback fn()) C.int {
	atexit_list.prepend(callback)
	return C.int(0)
}
