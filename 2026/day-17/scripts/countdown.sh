#!/bin/bash

read -p "Enter any positive number : " num

if [ $num -eq $num ] &>/dev/null;then
	:
else
	echo "Enter valid number"
	exit 1
fi
if [ $num -gt 0 ];then
	while [  $num -ge 0 ];do
		echo $num
		((num--))
	done
elif [ $num -lt 0 ];then
	while [ $num -le 0 ];do
		echo $num
		((num++))
	done
fi
echo "Done!"
