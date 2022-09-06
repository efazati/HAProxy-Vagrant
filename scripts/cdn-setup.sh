#!/bin/bash

if [ ! -f /etc/nginx/nginx.conf ]; then

  # Install Nginx
  apt -y install nginx
  cp /home/vagrant/files/nginx.conf /etc/nginx/sites-available/default

  sed -i 's/www-data/vagrant/' /etc/nginx/nginx.conf

  systemctl restart nginx

fi


