#ifndef __STDLIB_H__
#define __STDLIB_H__

#define EXIT_FAILURE 1
#define EXIT_SUCCESS 0

#ifdef __cplusplus
extern "C" {
#endif

void abort(void) __attribute__((noreturn));
void exit(int status) __attribute__((noreturn));
void _Exit(int status) __attribute__((noreturn));

#ifdef __cplusplus
}
#endif

#endif
