#!/bin/bash
userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "please run the script with root user id"
    exit 1
fi

echo "installing java"
dnf install java -y

if [ $? -ne 0 ]; then

   echo "installing java failure"
   exit 1
else
   echo "installing java is success"
fi