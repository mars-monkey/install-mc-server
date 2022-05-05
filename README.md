# install-mc-server
A simple, interactive Bash script to install a PaperMC Minecraft server.

## Installation Instructions

### Dependencies
In order to install this program, you must have `git` installed. To make sure it is installed run this command as root:
```
apt-get install git -y
```

### Installation
1. Navigate to your preferred installation directory. Two directories will be created here: `install-mc-server`, which contains the installation and removal scripts, and `mc-server`, which contains the actual server file.

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

## Removal instructions
1. Navigate to the `install-mc-server` directory.

2. Run the removal script with this command:
```
sudo ./REMOVE.sh
```
