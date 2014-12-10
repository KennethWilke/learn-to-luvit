# Getting Luvit setup locally

These steps we preformed on an Ubuntu 14.10 (Utopic Unicorn) VM, if this
doesn't work for you please submit a Pull Request to improve this document. The
Git command line tools will be used for setup and must be installed on your
system.

## Clone down the luvit/luvit repo

The luvit repo uses an interesting means of building that eliminates most of
the common tool chain used for building compiled applications. The main
repository contains a few submodules that will need to be pulled down, this can
be done in a single step.

```
$ git clone --recursive https://github.com/luvit/luvit
```

## Build it

Like building other nice tools from source we just use good ol' make

```
$ cd luvit
$ make
```

Then, as a root user, install it

```
# make install
```

If you don't have make you could also build as such:

```
$ `LUVI_APP=app LUVI_TARGET=luvit luvi-binaries/`uname -s`_`uname -m`/luvi
```

If installing this way, be sure to add the luvit binary to your $PATH.


And you got it! You're ready to go!

[Next Chapter: The strange bits of Lua](https://github.com/KennethWilke/learn-to-luvit/tree/master/chapter2)
