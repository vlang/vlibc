#ifndef __UNISTD_H__
#define __UNISTD_H__

#define _POSIX_MAPPED_FILES 1

#ifdef __cplusplus
extern "C" {
#endif

void _exit(int status) __attribute__((noreturn));

#ifdef __cplusplus
}
#endif

#endif
