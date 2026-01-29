#!/bin/bash
echo "given number is"
read num
if [ $num -gt 30 ] then
echo "given number is greater than 30"
elif [ $num -eq 30 ] then
echo "given number is equal to 30"
else
echo " given number is less than 30"
fi