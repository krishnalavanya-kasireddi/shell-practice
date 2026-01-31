#!/bin/bash
userid=$(id -u)
logs_folder="/var/log/shell-script/"
logs_file="/var/log/shell-script/$0.log"

if [ $userid -ne 0 ]; then
    echo "please run the script with root user id"
    exit 1
fi

mkdir -p $logs_folder

validate(){
    if [ $1 -ne 0 ]; then

   echo "$2... failure"
   exit 1
else
   echo "$2.... success"
fi
}

dnf install java -y &>> $logs_file
validate $? "installing java"

dnf install python -y &>> $logs_file
validate $? "installing python"

dnf install mysql -y &>> $logs_file
validate $? "installing mysql"


