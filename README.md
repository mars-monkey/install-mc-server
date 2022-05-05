# install-mc-server
A simple, interactive Bash script to install a PaperMC Minecraft server.

## Installation Instructions

### Dependencies
In order to install this program, you must have `git` installed. To make sure it is installed run the command for your distro as root:

Debian: `apt install git`

Arch: `pacman -S git`

Fedora: `dnf install git`

openSUSE: `zypper install git`

### Installation
1. Navigate to your preferred installation directory. The server directory ```install-mc-server``` containing all the necessary files will be created here.

2. Open a terminal at your preferred installation directory and type the following to download installation folder and enter it:
```
git clone https://github.com/starship-boi/install-mc-server
```
```
cd install-mc-server
```
3. Give INSTALL.sh execution permissions with this command:
```
chmod +x INSTALL.sh
```
4. Run INSTALL.sh as root with this command:
```
sudo ./INSTALL.sh
```
If you have already installed ```openjdk-17-jre-headless```, you may run it as a normal user, like so:
```
./INSTALL.sh
```

## Removal instructions
1. Navigate to the ```install-mc-server``` directory.

2. Run the removal script with this command:
```
sudo ./REMOVE.sh
```
