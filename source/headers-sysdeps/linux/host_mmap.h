#ifndef __HOST_MMAP_H__
#define __HOST_MMAP_H__

#define	PROT_NONE      0
#define	PROT_READ      1
#define	PROT_WRITE     2
#define	PROT_EXEC      4
#define	PROT_GROWSDOWN 0x01000000
#define	PROT_GROWSUP   0x02000000

#define MAP_TYPE       0x0f
#define MAP_FILE       0x00
#define MAP_ANON       0x20
#define MAP_NORESERVE  0x4000
#define MAP_GROWSDOWN  0x0100
#define MAP_DENYWRITE  0x0800
#define MAP_EXECUTABLE 0x1000
#define MAP_LOCKED     0x2000
#define MAP_POPULATE   0x8000
#define MAP_NONBLOCK   0x10000
#define MAP_STACK      0x20000
#define MAP_HUGETLB    0x40000

#endif
