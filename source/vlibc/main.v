module main

import sysdeps

// Here because v wants one.
fn main() {
	return
}

fn C.main(argc int, argv &charptr, envp &charptr) int

[export: '__vlibc_init']
pub fn vlibc_init(argc int, argv &charptr, envp &charptr) {
	ret := C.main(argc, argv, envp)
	sysdeps.sys_exit(ret)
}
