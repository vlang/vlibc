#ifndef __STDLIB_H__
#define __STDLIB_H__

#include <stddef.h>

#define EXIT_FAILURE 1
#define EXIT_SUCCESS 0

#ifdef __cplusplus
extern "C" {
#endif

void abort(void) __attribute__((noreturn));
void exit(int status) __attribute__((noreturn));
void _Exit(int status) __attribute__((noreturn));
int atexit(void (*function)(void));

void *malloc(size_t size);
void *calloc(size_t num, size_t size);
void *realloc(void *ptr, size_t new_size);
void free(void *ptr);

void qsort(void *base, size_t count, size_t width, int (*compare)(void *, void *));

#ifdef __cplusplus
}
#endif

#endif
