#!/bin/bash

install_java () {
	echo -e "\e[44mInstalling openjdk 17...\e[0m"
	sudo apt-get install openjdk-17-jre-headless -y
	
	# Print error message from installation exit code
	if [ $? == 0 ]
	then
		echo -e "\e[44mInstallation succeeded!\e[0m"
	elif [ $? == 126 ]
	then
		echo -e "\e[44mInstallation failed: insufficient permissions to execute command\e[0m"
	else
		echo -e "\e[44mInstallation failed: general error\e[0m"
	fi
}

echo -e "\e[44mThis script installs the PaperMC Minecraft server for Minecraft version 1.18.2.\e[0m"
echo -e "\e[44mFor information on supported platforms, see README.md\e[0m"

cd ..
parent_directory=$(pwd)
cd install-mc-server

mv remove.sh $parent_directory/remove.sh
cd ..
chmod +x remove.sh

# Check whether Java 17 is installed
if [ ! -s /usr/bin/java ] || [[ $(java --version) != *"openjdk 17"* ]]
then
	echo -e "\e[44mYou do not currently have the correct version of Java installed.\e[0m"
	
	echo -e "\e[44mWould you like the script to install the correct version of Java for you? (y/n)\e[0m"
	read autoinst_java
	
	if [[ $autoinst_java == "y" ]]
	then
		install_java
	else
		echo -e "\e[44mYou must install the correct version of Java to proceed with the server installation.\e[0m"
		echo -e "\e[44mEither run the script again and allow the script to install Java, or install openjdk-17-jre-headless yourself.\e[0m"
		exit 256
	fi
fi

mkdir mc-server
cd mc-server

# Download PaperMC server JAR file
wget https://papermc.io/api/v2/projects/paper/versions/1.18.2/builds/331/downloads/paper-1.18.2-331.jar

echo "cd $parent_directory/mc-server && java -Xmx1G -jar $parent_directory/mc-server/paper-1.18.2-331.jar -nogui" | sudo tee /usr/bin/mc-start
sudo chmod +x /usr/bin/mc-start

# Sets up server files
mc-start

# Agree to EULA
echo -e "\e[44mYou must agree to the Minecraft EULA to proceed with the server installation. (https://www.minecraft.net/en-us/eula)\e[0m"
cat $parent_directory/mc-server/eula.txt
echo -e "\e[44mDo you agree to the EULA? (y/N)\e[0m"
read agree_eula

if [[ $agree_eula == "y" ]]
then
	rm $parent_directory/mc-server/eula.txt
	touch $parent_directory/mc-server/eula.txt
	echo "eula=true" 1>$parent_directory/mc-server/eula.txt
else
	echo -e "\e[44mYou must agree to the EULA to proceed with the server installation.\e[0m"
	echo -e "\e[44mEither run the script again and agree to the EULA, or manually change the 'eula=false' line in eula.txt to 'eula=true'.\e[0m"
	exit 256
fi

sudo chown $USER $parent_directory/mc-server

echo -e "\e[44mThe server installation is complete. You may start the server by typing 'mc-start' at the terminal. See README.md for further instructions\e[0m"
echo -e "\e[44mYou may want to change some basic server settings. These are stored at $parent_directory/mc-server/server.properties.\e[0m"
exit 0
