FROM elixir:1.5.0
RUN apt-get update
RUN apt-get install -y mysql-client mysql-server
