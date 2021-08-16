#ifndef __STRING_H__
#define __STRING_H__

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

size_t strlen(const char *str);
void  *memset(void *destination, int value, size_t count);
void  *memcpy(void *destination, const void *source, size_t count);
int    memcmp(const void *source1, const void *source2, size_t count);
void  *memmove(void *destination, const void *source, size_t count);

#ifdef __cplusplus
}
#endif

#endif
