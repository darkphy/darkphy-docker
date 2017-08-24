FROM bitwalker/alpine-elixir:latest

#ARG NODE_MAJOR_VERSION=8



# Install local Elixir hex and rebar
RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force
