#ifndef __SYS_MMAN_H__
#define __SYS_MMAN_H__

#include <sys/host_mmap.h>

#define MAP_ANONYMOUS MAP_ANON

#ifdef __cplusplus
extern "C" {
#endif

void *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset);
int munmap(void *addr, size_t length);

#ifdef __cplusplus
}
#endif
