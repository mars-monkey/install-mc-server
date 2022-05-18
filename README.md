# install-mc-server
A simple, interactive Bash script to install a PaperMC Minecraft server.

## Supported platforms
Distros based on the following and later versions are supported:
* Ubuntu 18.04
* Debian 11

## Installation Instructions

### Dependencies
In order to install this program, you must have `git` installed. To make sure it is installed run this command as root:
```
apt-get install git -y
```

### Installation
1. Navigate to your preferred installation directory. Two directories will be created here: `install-mc-server`, which contains the installation and removal scripts, and `mc-server`, which contains the actual server file.

2. Open a terminal at your preferred installation directory and type the following to download the installation folder and enter it:
```
git clone https://github.com/starship-boi/install-mc-server && cd install-mc-server
```

3. Give INSTALL.sh execution permissions and run it with this command:
```
chmod +x install.sh && ./install.sh
```

## Removal instructions
1. Navigate to the parent directory containing both `install-mc-server` and `mc-server`.

2. Run the removal script with this command:
```
./remove.sh
```

3. Delete `remove.sh`.
