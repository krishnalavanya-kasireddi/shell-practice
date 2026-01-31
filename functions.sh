#!/bin/bash
userid=$(id -u)
logs_folder="/var/log/shell-script/"
logs_file="/var/log/shell-script/$0.log"

if [ $userid -ne 0 ]; then
    echo "please run the script with root user id" | tee -a $logs_file
    exit 1
fi

mkdir -p $logs_folder

validate(){
    if [ $1 -ne 0 ]; then

   echo "$2... failure" | tee -a $logs_file
   exit 1
else
   echo "$2.... success" | tee -a $logs_file
fi
}

dnf install java -y &>> $logs_file
validate $? "installing java"

dnf install python -y &>> $logs_file
validate $? "installing python"

dnf install https://repo.mysql.com/mysql80-community-release-el9-5.noarch.rpm -y &>> $logs_file
validate $? "installing mysql repo"

rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023 &>> $logs_file
validate $? "importing mysql gpg key"

dnf clean all &>> $logs_file
dnf makecache &>> $logs_file

dnf install mysql-community-server -y &>> $logs_file
validate $? "installing mysql"


