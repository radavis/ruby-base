FROM ruby:3.0.3-alpine AS base
RUN apk update && apk upgrade --no-cache
RUN apk add --no-cache \
  bash \
  build-base \
  curl \
  less \
  mariadb-dev \
  nodejs \
  npm \
  tzdata \
  yarn
SHELL ["/bin/bash", "-c"]
ENV HOME=/home/app
WORKDIR /home/app
COPY .gemrc /usr/local/etc
ENV BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3
COPY Gemfile ./
RUN bundle install
CMD ["rails", "server", "--binding=0.0.0.0", "--port=3000"]

FROM base AS docs
WORKDIR /home/docs
RUN gem install yard
RUN curl -OL https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.3.tar.gz
RUN tar -zxf ruby-3.0.3.tar.gz && rm ruby-3.0.3.tar.gz
RUN mv ruby-3.0.3/* .
RUN yardoc --db .yardoc-ruby3-core --output-dir doc/ruby3-core *.c > /dev/null
RUN yardoc --db .yardoc-ruby3-stdlib --output-dir doc/ruby3-stdlib > /dev/null
RUN gem rdoc --all
RUN yard gems
CMD yard server --gems \
  --multi-library \
    _ruby3-core .yardoc-ruby3-core \
    _ruby3-stdlib .yardoc-ruby3-stdlib \
  --port 8808
