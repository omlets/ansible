#!/bin/bash

user_exist=`cat /etc/passwd | grep $1 | wc -l`

if [ $user_exist -eq 1 ];
then
	sudo_enable=`cat /etc/sudoers | grep $1 | wc -l`
	if [ $sudo_enable -eq 1 ];
	then
		echo "User aredy in sudoers..."
	else
		echo "$1 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
		echo "Done."
		exit 0;
	fi
else
	echo "User not found..."
	exit 1;
fi
