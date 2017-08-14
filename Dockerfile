
FROM elixir:latest

# install depencies
RUN apt-get update && apt-get install -y 
    mysql-server \
    mysql-client
