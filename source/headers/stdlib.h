#ifndef __STDLIB_H__
#define __STDLIB_H__

#include <stdint.h>

#define EXIT_FAILURE 1
#define EXIT_SUCCESS 0

#ifdef __cplusplus
extern "C" {
#endif

void abort(void) __attribute__((noreturn));
void exit(int status) __attribute__((noreturn));
void _Exit(int status) __attribute__((noreturn));

void qsort(void *base, size_t count, size_t width, int (*compare)(void *, void *));

#ifdef __cplusplus
}
#endif

#endif
