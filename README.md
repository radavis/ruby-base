# README

## Getting Started

Build an image called `ruby-base` from `Dockerfile` instructions.

```bash
$ docker build --help
# docker build [OPTIONS] PATH | URL | -
$ docker build --tag ruby-base
# "docker build" requires exactly 1 argument. # 🤦
$ docker build --tag ruby-base .
```

Run a command from within a `ruby-base` container.

```bash
$ docker run --help
# docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
$ docker run --interactive --tty ruby-base irb
irb(main):001:0> exit
# docker run -it ruby-base irb # short options for above
# docker run -it ruby-base /bin/bash # open bash prompt within container
```

When using Docker for one-off tasks or for experiments in `irb`, Docker
will leave a container on the disk after exit, potentially wasting disk storage.
To clean up after ourselves, do the following.

```bash
$ docker run --help | grep remove
# --rm  Automatically remove the container when it exits
$ docker run --rm -it ruby-base irb
```

A `run` script is provided.

```bash
$ ./bin/run irb
$ ./bin/run bash
```

Or, create your own alias.

```bash
$ alias ruby-run="docker run --rm --interactive --tty ruby-base"
$ ruby-run irb
```
