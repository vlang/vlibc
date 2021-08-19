module main

import libc // Else V does not compile it.

// Here because v wants one.
fn main() {
	return
}

fn C.main(argc C.int, argv &charptr, envp &charptr) C.int

[export: '__vlibc_init']
pub fn vlibc_init(argc C.int, argv &charptr, envp &charptr) {
	ret := C.main(argc, argv, envp)
	libc.c_exit(ret)
}
