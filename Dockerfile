FROM bitwalker/alpine-elixir:latest

#ARG NODE_MAJOR_VERSION=8

ARG NODE_VER=8.0
ARG NPM_VER=latest
ARG YARN_VER=latest

RUN \
    apk update && \
    apk add mysql-client



RUN apk -U add curl git make gcc g++ python linux-headers paxctl libgcc libstdc++ binutils-gold ca-certificates \
 && cd /tmp \
 && curl --silent --ssl https://nodejs.org/dist/v$NODE_VER/node-v$NODE_VER.tar.gz | tar zxf - \
 && cd node-v$NODE_VER \
 && ./configure --prefix=/usr \
 && make -j1 && make install \
 && paxctl -cm /usr/bin/node \
 && npm install -g npm@$NPM_VER \
 && npm install -g yarn@$YARN_VER \
 && find /usr/lib/node_modules/npm -name test -o -name .bin -type d \
 | xargs rm -rf \
 && apk del \
    curl \
    git \
    make \
    gcc \
    g++ \
    python \
    linux-headers \
    paxctl \
    grep \
    binutils-gold \
    ca-certificates \
 && rm -rf \
    /tmp/* \
    /var/cache/apk/* \
    /root/.npm \
    /root/.node-gyp \
    /usr/lib/node_modules/npm/man \
    /usr/lib/node_modules/npm/doc \
    /usr/lib/node_modules/npm/html \
    /usr/share/man



# Install local Elixir hex and rebar
RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force
