#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y nginx

sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>Welcome to Nginx Server</h1>" > /var/www/html/index.html
