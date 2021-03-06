# ruby-base

An explanation of how the core files here came to be.

## Steps

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

Mount the current working directory into the container, so that we can write
code from within tthe host OS, and run that code within the container.

```bash
$ docker run --rm -it --volume "$(pwd):/home/app" ruby-base ruby /home/app/lib/hello_world.rb
# Hi 👋
```

If we add a `WORKDIR` within our Dockerfile, we can save a few characters.

```bash
# Dockerfile:
# WORKDIR /home/app
$ docker build --tag ruby-base .
$ docker run --rm -it -v "$(pwd):/home/app" ruby-base ruby lib/hello_world.rb
# Hi 👋
```

Generate a Gemfile with Bundler.

```bash
# bundler is preinstalled, no need to `gem install bundler`
$ docker run --rm -it -v "$(pwd):/home/app" ruby-base bundle init
$ la
# -rw-r--r-- 1 root root  147 Feb 13 09:47 Gemfile
$ sudo rm Gemfile
```

To fix the permissions and ownership of files generated within containers, we
can give docker our user and group ids.

```bash
$ docker run --help | grep user
# -u, --user string  Username or UID (format: <name|uid>[:<group|gid>])
$ id -u; id -g
# 1000
# 1000
$ docker run --rm -it -v "$(pwd):/home/app" --user "$(id -u):$(id -g)" ruby-base bundle init
```

Add dependencies to the Gemfile, and install them.

```bash
$ docker run --rm -it -v "$(pwd):/home/app" -u "$(id -u):$(id -g)" ruby-base bundle install
# `/` is not writable.
# Bundler will use `/tmp/bundler20220214-1-bnutv01' as your home directory temporarily.
```

The container OS doesn't recognize our UID/GID when installing gems.
We can get around this by moving the `bundle install` step to our build script.

```Dockerfile
FROM ruby:3.0.3-alpine
RUN apk update && apk upgrade --no-cache
WORKDIR /home/app
COPY Gemfile ./
RUN bundle install
```

See `bin/build`, `bin/run`, and the readme.

## Troubleshooting

Cleanup containers, networks, volumes, and so on.

```bash
$ docker system prune --all
```

## Documentation

* [Build](https://docs.docker.com/engine/reference/commandline/build/)
* [Run](https://docs.docker.com/engine/reference/run/)
* [Volumes](https://docs.docker.com/storage/volumes/)
