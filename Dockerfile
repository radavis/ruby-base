FROM ruby:3.0.3-alpine AS base
RUN apk update && apk upgrade --no-cache
# RUN apk add --no-cache \
#   bash \
#   less
# SHELL ["/bin/bash", "-c"]
COPY .gemrc /usr/local/etc
WORKDIR /home/app
COPY Gemfile ./
RUN bundle install

FROM base AS docs
RUN gem install yard
RUN gem rdoc --all
RUN yard gems
CMD ["yard", "server", "-G"]
