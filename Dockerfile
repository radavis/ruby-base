FROM ruby:3.0.3-alpine
RUN apk update && apk upgrade --no-cache
# RUN apk add --no-cache \
#   bash \
#   less
# SHELL ["/bin/bash", "-c"]
WORKDIR /home/app
