# Porting vlibc

To get the changes on tree please make a pull request, I can mantain and update
them from there if needed.

The modifications to do to port vlibc are located in 4 folders, and are the
following:

- `source/crt`: crt0, declared in `if`s for each port.
- `headers-sysdeps`: The headers representing the sysdeps along with OS-specific
functions.
- `sysdeps`: The actual V code for the sysdeps.

## Headers necessary under headers-sysdeps

All OS specific headers your OS needs, nothing else so far.

## Functions necessary under sysdeps

None so far.
