# Porting vlibc

## How to port

To get the changes on tree please make a pull request, I can mantain and update
them from there if needed.

The modifications to do to port vlibc are located in 3 folders, and are the
following:

- `source/crt`: crt0, declared in a file for each OS/arch combination.
- `headers-sysdeps`: The headers representing the sysdeps along with OS-specific
functions.
- `vlibc/sysdeps`: The actual V code for the sysdeps, one file per OS, and
language features for separate architectures.

## Headers necessary under headers-sysdeps

All OS specific headers your OS needs, nothing else so far.

## Functions necessary under sysdeps

- `sys_exit`: POSIX-compatible `_exit` equivalent.
