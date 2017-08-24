FROM bitwalker/alpine-elixir:latest

#ARG NODE_MAJOR_VERSION=8

RUN \
    apk update && \
    apk add mysql-client nodejs nodejs-npm yarn docker

# Install local Elixir hex and rebar
RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force

RUN /etc/init.d/service docker start
RUN docker ps

