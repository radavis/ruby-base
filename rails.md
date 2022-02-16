# Rails

How we got from branch `main` to `rails`

```bash
$ bin/build
$ bin/run rails new --help
$ bin/run rails new . \
    --database=mysql \
    --skip-turbolinks \
    --skip-jbuilder \
    --skip-bundle \
    --skip-webpack-install \
    --skip-spring \
    --skip-bootsnap \
    --skip-listen
# Overwrite the Gemfile, but not the README
$ bin/build
$ bin/run rails webpacker:install
```

## User Model

```bash
$ bin/run rails generate model User name:string email:string
$ bin/run rails db:migrate
# code
$ bin/run rails test
```
