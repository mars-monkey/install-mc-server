#!/bin/bash

# Check for root
mkdir /tmp/test_perms

if [ -d /tmp/test_perms ]
then
	rmdir /tmp/test_perms
else
	echo "This script was not run as root. You must run it as root to remove the Minecraft server."
fi

rm /usr/bin/mc-start

cd ..
rm -rf install-mc-server mc-server

echo "Would you like the script to remove openjdk-17-jre-headless? (y/N)"
read rm_java

if [[ $rm_java == "y" ]]
then
	apt-get remove openjdk-17-jre-headless -y 1>/dev/null
fi

echo "Would you like the script to remove git? (y/N)"
read rm_git

if [[ $rm_git == "y"]]
then
	apt-get remove git -y 1>/dev/null
fi
