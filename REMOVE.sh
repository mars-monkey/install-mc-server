#!/bin/bash

sudo echo ""

sudo rm /usr/bin/mc-start

sudo rm -rf install-mc-server mc-server

echo "Would you like the script to remove openjdk-17-jre-headless? (y/N)"
read rm_java

if [[ $rm_java == "y" ]]
then
	sudo apt-get remove openjdk-17-jre-headless -y 1>/dev/null
fi

echo "Would you like the script to remove git? (y/N)"
read rm_git

if [[ $rm_git == "y" ]]
then
	sudo apt-get remove git -y 1>/dev/null
fi

exit 0
