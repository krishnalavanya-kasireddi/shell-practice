#!/bin/bash
userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "please run the script with root user id"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then

   echo "$2... failure"
   exit 1
else
   echo "$2.... success"
fi
}

dnf install java -y
validate $? "installing java"

dnf install python -y
validate $? "installing python"

dnf install https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm -y
validate $? "installing mysql repo"

rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
validate $? "importing mysql gpg key"

dnf clean all
dnf makecache

dnf install mysql-community-server -y
validate $? "installing mysql"


