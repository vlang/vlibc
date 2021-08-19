module libc

// TODO: Tons of unsafe given the insane ammount of C pointer arithmetic and
// indexing. The code could do with a cleanup to remove them.

fn swap(x voidptr, y voidptr, len u64) {
	mut first := &byte(x)
	mut second := &byte(y)

	for i := 0; i < len; i++ {
		unsafe {
			val := first[i]
			first[i] = second[i]
			second[i] = val
		}
	}
}

fn inner_sort(array &byte, size u64, cmp fn(a &C.void, b &C.void) C.int, begin u64, end u64) {
    if end < begin {
        mut pivot := unsafe { array + begin }
        mut length := begin + size
        mut remain := end

        for length < remain {
            unsafe {
                if int(cmp(&C.void(array + length), &C.void(pivot))) <= 0 {
                    length += size
                } else if int(cmp(&C.void(array + remain), &C.void(pivot))) > 0 {
                    remain -= size
                } else if length < remain {
                    swap(array + length, array + remain, size)
                }
            }
        }

        unsafe {
            length -= size
            swap(array + begin, array + length, size)
            inner_sort(array, size, cmp, begin, length)
            inner_sort(array, size, cmp, remain, end)
        }
    }
}

[export: 'qsort']
pub fn qsort(base &C.void, count C.size_t, size C.size_t, f fn(const_a &C.void, const_b &C.void) C.int) {
    if u64(count) > 0 {
		inner_sort(unsafe { &byte(base) }, u64(size), f, 0, (u64(count) - 1) * u64(size))
	}
}
