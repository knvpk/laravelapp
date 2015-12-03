FROM ubuntu:15.10

MAINTAINER "Pavan kumar katakam" <k.pavan@invizotechnologies.com>

WORKDIR /tmp

# Install Nginx
RUN apt-get update -y && \
    apt-get install -y wget curl vim tmux htop software-properties-common && \
    apt-get install -y nginx

# Apply Nginx configuration
ADD config/laravel /etc/nginx/sites-available/laravel
RUN ln -s /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/laravel && \
    rm /etc/nginx/sites-enabled/default

RUN mkdir -p /data

# PORTS
EXPOSE 80
EXPOSE 443

WORKDIR /opt/bin

