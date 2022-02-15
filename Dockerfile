FROM ruby:3.0.3-alpine AS base
RUN apk update && apk upgrade --no-cache
RUN apk add --no-cache \
  bash \
  build-base \
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

FROM base AS docs
RUN gem install yard
RUN gem rdoc --all
RUN yard gems
CMD ["yard", "server", "-G"]
