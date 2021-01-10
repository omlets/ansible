#!/bin/bash

user_status=`cat /etc/passwd | grep $1 | wc -l`

if [ $user_status -eq 1 ];
then
	if [ -d /home/$1 ];
	then
		LPT="PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '"
		LP=`cat /home/$1/.bashrc | grep PS1 | tail -n1`

		if [ "$LPT" = "$LP" ];
		then
			echo "Done"
		else
			echo "Not mach... Change loign promt"
		cd /home/$1/ && echo ${LPT} >> .bashrc
		fi

		LPT="PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '"
		LP=`sudo cat /root/.bashrc | grep PS1 | tail -n1`

		if [ "$LPT" = "$LP" ];
		then
			echo "Done"
		else
			echo "Not mach... Change loign promt"
		sudo echo ${LPT} >> /root/.bashrc
		fi
	else
		echo "Home directory do not esxist..."
		exit 1;

	fi
else
	echo "User do not esxist..."
	exit 1;
fi


