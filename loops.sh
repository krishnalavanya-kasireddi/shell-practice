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

for package in $@
do 
 dnf install $package -y &>> $logs_file
 validate $? "$package installation"
done 