module libc

import sysdeps

[export: 'mmap']
pub fn mmap(addr voidptr, length C.size_t, prot C.int, flags C.int, fd C.int, offset C.off_t) voidptr {
	return sysdeps.sys_mmap(addr, u64(length), int(prot), int(flags), int(fd), int(offset))
}

[export: 'munmap']
pub fn munmap(addr voidptr, length C.size_t) int {
	return sysdeps.sys_munmap(addr, u64(length))
}
