#!/bin/bash

install_java () {
	echo "Installing openjdk 17..."
	sudo apt-get install openjdk-17-jre-headless -y
	
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
}

echo "This script installs the PaperMC Minecraft server for Minecraft version 1.18.2."
echo "For information on supported platforms, see README.md"
echo ""

cd ..
parent_directory=$(pwd)
cd install-mc-server

mv remove.sh $parent_directory/remove.sh
cd ..
chmod +x remove.sh

# Check whether Java 17 is installed
if [ ! -s /usr/bin/java ] || [[ $(java --version) != *"openjdk 17"* ]]
then
	echo "You do not currently have the correct version of Java installed."
	
	echo "Would you like the script to install the correct version of Java for you? (y/n)"
	read autoinst_java
	
	if [[ $autoinst_java == "y" ]]
	then
		install_java
	else
		echo "You must install the correct version of Java to proceed with the server installation."
		echo "Either run the script again and allow the script to install Java, or install openjdk-17-jre-headless yourself."
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
echo "You must agree to the Minecraft EULA to proceed with the server installation."
cat $parent_directory/mc-server/eula.txt
echo "Do you agree to the EULA? (y/N)"
read agree_eula

if [[ $agree_eula == "y" ]]
then
	rm $parent_directory/mc-server/eula.txt
	touch $parent_directory/mc-server/eula.txt
	echo "eula=true" 1>$parent_directory/mc-server/eula.txt
else
	echo "You must agree to the EULA to proceed with the server installation."
	echo "Either run the script again and agree to the EULA, or manually change the 'eula=false' line in eula.txt to 'eula=true'."
	exit 256
fi

sudo chown $USER $parent_directory/mc-server

echo "The server installation is complete. You may start the server by typing 'mc-start' at the terminal."
echo "You may want to change some basic server settings. These are stored at $parent_directory/mc-server/server.properties."
exit 0
