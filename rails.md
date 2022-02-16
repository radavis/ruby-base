# Rails

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
# Overwrite the Gemfile
$ bin/build
$ bin/run rails webpacker:install
```
