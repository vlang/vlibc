# vlibc, the V libc.

A POSIX-compatible libc meant for ease of porting and performance for hobbyist
OSes, obtaining this by using the V programming language.

## Porting

To learn about porting vlibc to a new OS or architecture please refer to
[this document](PORTING.md).

## Building

A Makefile is provided, featuring a `PREFIX` and `DESTDIR` variables for
choosing a path for installation. Along with those, a `TARGET_OS` and
`TARGET_ARCH` variables are provided for choosing the target to build the libc
for.

Only a V toolchain along with a C toolchain are needed for compiling the
project.

An example process would be:

```bash
make CFLAGS="-O2 -pipe"     # Optimization flags are not passed by default.
make test                   # Run the automated tests.
make PREFIX="/usr/" install # Install, feel free to use PREFIX or DESTDIR.
```
