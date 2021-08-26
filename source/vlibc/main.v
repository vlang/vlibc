module main

import libc

// Here because v wants one.
fn main() {
	return
}

fn C.main(argc C.int, argv &charptr, envp &charptr) C.int
fn C._vinit(argc C.int, argv &charptr)

[export: '__vlibc_init']
pub fn vlibc_init(argc C.int, argv &charptr, envp &charptr) {
	// Initialize V itself.
	// C._vinit(argc, argv)

	ret := C.main(argc, argv, envp)
	libc.c_exit(ret)
}
