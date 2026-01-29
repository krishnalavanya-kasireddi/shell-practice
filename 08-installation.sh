#!/bin/bash
userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "please run the script with root user id"
    
fi

echo "installing nginx"
dnf install Nginx -y