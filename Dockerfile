
FROM elixir:latest

# install depencies
RUN apt-get install -y \
    mysql-server 
