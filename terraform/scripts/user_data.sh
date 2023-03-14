#!/bin/bash
    
# Update with latest packages
yum update -y
    
# Install Apache
yum install -y httpd
    
# Enable Apache service to start after reboot
sudo systemctl enable httpd
    
# Install Hello World application
echo "Hello World !!!" > /var/www/html/index.html
    
# Start Apache service
service httpd restart