# Getting Luvit setup locally

These steps we preformed on an Ubuntu 14.10 (Utopic Unicorn) VM, if this
doesn't work for you please submit a Pull Request to improve this document. The
Git command line tools will be used for setup and must be installed on your
system. The make program is also required for building.

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

And you got it! You're ready to go!

[Next Chapter](https://github.com/KennethWilke/learn-to-luvit/tree/master/chapter2)
