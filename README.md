# ruby-base

`Dockerfile` and supporting scripts for running ruby code within a container.

## Getting Started

- `build` - execute instructions within Dockerfile, creating `ruby-base` container
- `run` - execute command(s) within `ruby-base` conatiner

```bash
$ ./bin/build
$ ./bin/run ruby lib/hello_world.rb
```

Or, use the provided aliases.

```bash
$ source .alias
$ ruby-build
$ ruby-run ruby lib/hello_world.rb
```

## Installing Gems

```bash
$ ./bin/run bundle init
# Writing new Gemfile to /home/app/Gemfile
# modify Gemfile, then
$ ./bin/run bundle install
```
