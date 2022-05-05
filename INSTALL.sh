#!/bin/bash

echo "This script installs the PaperMC Minecraft server for Minecraft version 1.18.2."
echo "It was designed for Ubuntu 22.04 LTS. It will likely work with future releases of Ubuntu."
echo "I might work with earlier versions of Ubuntu, Ubuntu derivatives, or other Debian derivatives."
echo "It will NOT work with other distros that do not use the APT package manager, i.e. RHEL, Arch, or openSUSE."
echo ""

# Test whether script is run as root
mkdir /tmp/test_perms 2>/dev/null
if [ $? == 0 ]
then
	rmdir /tmp/test_perms
else
	echo "This must be run as root."
	exit 126
fi

# Check whether Java 17 is installed
if [ -e /usr/bin/java ] && [[ $(java --version) == *"openjdk 17"* ]]
then
	java_installed="True"
else
	java_installed="False"
fi

# Ask to install Java automatically
if [[ $java_installed != "True" ]]
then
	echo "You do not currently have the correct version of Java installed."
	
	echo "Would you like the script to install the correct version of Java for you? (y/n)"
	read install_java
fi

if [ $install_java == "y" ]
then
	echo "Installing openjdk 17..."
	apt-get install openjdk-17-jre-headless -y >1/dev/null
	
	# Print error message from installation exit code
	if [ $? == 0 ]
	then
		echo "Installation succeeded!"
	elif [ $? == 126 ]
	then
		echo "Installation failed: insufficient permissions to execute command"
	else
		echo "Installation failed: general error"
	fi
else
	echo "You must install the correct version of Java to proceed with the server installation."
	echo "Either run the script again as root and allow the script to install Java, or install openjdk-17-jre-headless yourself."
	exit 256
fi

cd ..
parent_directory=$(pwd)

mkdir mc-server
cd mc-server

# Download PaperMC server JAR file
wget https://papermc.io/api/v2/projects/paper/versions/1.18.2/builds/312/downloads/paper-1.18.2-312.jar 1>/dev/null

touch /usr/bin/mc-start
echo "java -Xmx1G -jar $parent_directory/mc-server" 1>/usr/bin/mc-start

# Sets up server files
mc-start

# Agree to EULA
echo "You must agree to the Minecraft EULA to proceed with the server installation."
cat eula.txt
echo "Do you agree to the EULA? (y/n)"
read agree_eula

if [ agree_eula == "y" ]
then
	echo "eula=true" 1>$parent_directory/eula.txt
else
	echo "You must agree to the EULA to proceed with the server installation."
	echo "Either run the script again and agree to the EULA, or manually change the 'eula=false' line in eula.txt to 'eula=true'."
	exit 256
fi

echo "The server installation is complete. You may start the server by typing 'mc-start' at the terminal."
echo "You may want to change some basic server settings. These are stored at $pwd/mc-server/server.properties."
exit 0
