module libc

// TODO: Implement.

[export: 'malloc']
pub fn malloc(size C.size_t) voidptr {
	return voidptr(0)
}

[export: 'calloc']
pub fn calloc(count C.size_t, size C.size_t) voidptr {
	return voidptr(0)
}

[export: 'realloc']
pub fn realloc(ptr voidptr, new_size C.size_t) voidptr {
	return voidptr(0)
}

[export: 'free']
pub fn free(ptr voidptr) {
	return
}
