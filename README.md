# install-mc-server
A simple, interactive Bash script to install a PaperMC Minecraft server.

## Supported platforms
Distros based on the following and later versions are supported:
* Ubuntu 18.04
* Debian 11

## Installation Instructions

### Dependencies
In order to install this program, you must have `git` installed. To make sure it is installed run this command:
```
sudo apt-get install git -y
```

### Installation
1. Navigate to your preferred installation directory. Two directories will be created here: `install-mc-server`, which contains the installation and removal scripts, and `mc-server`, which contains the actual server file.

2. Open a terminal at your preferred installation directory and type the following to download the installation folder and enter it:
```
git clone https://github.com/starship-boi/install-mc-server && cd install-mc-server
```

3. To give INSTALL.sh execution permissions and run it, use this command:
```
chmod +x install.sh && ./install.sh
```

## Launch the Server
Open a terminal anywhere and type the following command to start the Minecraft server:
```
mc-start
```
This will spit out a bunch of text, but once you see 'Timings reset' then you can type commands of your own if you want. The commands are the same as in game Minecraft commands, except you don't need to type '/' at the beginning.

## Removal instructions
1. Navigate to the parent directory containing both `install-mc-server` and `mc-server`.

2. Run the removal script with this command:
```
./remove.sh
```

3. Delete `remove.sh`.
