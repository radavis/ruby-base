# ruby-base

This repository contains a `Dockerfile` and supporting scripts for running ruby
code within a container.

## Getting Started

- `build` - execute instructions within Dockerfile, install dependencies declared in `Gemfile`, creating the `ruby-base` container
- `run` - execute command(s) within `ruby-base` conatiner

```bash
$ bin/build
$ bin/run ruby lib/hello_world.rb
```

## Documentation

Add a gem to the Gemfile, then start the docs server.

```Gemfile
source "https://rubygems.org"
gem "httparty"
```

```bash
$ bin/docs
# visit localhost:8808
```

## Rails

Manage the docker network

```bash
$ bin/net
Usage: bin/net [--up|--down|--info]
```

Manage the database service

```bash
$ bin/db
Usage: bin/db [--up|--down|--logs]
```

Run migrations

```bash
$ bin/run rails db:migrate
```

Start the application

```bash
$ bin/run
```

Run `bin/net --info`, find the `ruby-base-web` container IP address (e.g. - `172.23.0.3`).

Visit the application

```bash
$ open http://172.23.0.3:3000
```
