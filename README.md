# ruby-base

`Dockerfile` and supporting scripts for running ruby code within a container.

## Getting Started

- `build` - execute instructions within Dockerfile, install dependencies declared in `Gemfile`, creating the `ruby-base` container
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
