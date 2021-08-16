module libc

[export: 'strlen']
pub fn strlen(const_str &char) u64 {
	mut i := 0
	for unsafe { const_str[i] } != char(`\0`) {
		i += 1
	}
	return u64(i)
}

[export: 'memset']
pub fn memset(destination voidptr, value int, count u64) voidptr {
	mut ptr := &byte(destination)
	for i := 0; i < count; i++ {
		unsafe { ptr[i] = byte(value) }
	}
	return destination
}

[export: 'memcpy']
pub fn memcpy(destination voidptr, const_source &C.void, count u64) voidptr {
    mut dest := &byte(destination)
    src := unsafe { &byte(const_source) }
    for i := 0; i < count; i++ {
        unsafe { dest[i] = src[i] }
    }
    return destination
}

[export: 'memcmp']
pub fn memcmp(const_source1 &C.void, const_source2 &C.void, count u64) int {
    src1 := unsafe { &byte(const_source1) }
    src2 := unsafe { &byte(const_source2) }

    for i := 0; i < count; i++ {
		s1 := unsafe { src1[i] }
		s2 := unsafe { src2[i] }
        if s1 != s2 {
            return if s1 < s2 { -1 } else { 1 }
        }
    }

    return 0
}

[export: 'memmove']
pub fn memmove(destination voidptr, const_source &C.void, count u64) voidptr {
    mut dest := &byte(destination)
    src := unsafe { &byte(const_source) }

    if const_source > destination {
        for i := 0; i < count; i++ {
            unsafe { dest[i] = src[i] }
        }
    } else if const_source < destination {
        for i := count; i > 0; i-- {
            unsafe { dest[i - 1] = src[i - 1] }
        }
    }

    return dest
}
