#!/usr/bin/bash

PACKAGES_TO_INSTALL=(
	"git"
	"bluez"
	"bluez-utils" 
	"asciiquarium" 
	"chromium"
	"kitty"
	"vim"
	"nano"
	"neofetch"
	"nmap"
	"openssh"
	"python-pip"
	"qbittorrent"
	"tmux"
	"vlc"
	"signal-desktop"
	"wget"
	"which"
	"net-tools"
	"xdotool"	
	"xclip"
)

# pacman -Qi <package_name> returns 0 if installed, 1 if not

check_package () {
	if pacman -Qi $1 > /dev/null ; then
		echo $1 "already installed"
	else
		pacman -S $1
	fi
}

pacman -Syu

for package in "${PACKAGES_TO_INSTALL[@]}"
do
	check_package $package
done

conf_kitty () {
	kitty +kitten themes Gruvbox Dark Hard
}

conf_kitty

conf_zsh () {
	check_package zsh
	check_package zsh-completions
	chsh -s $(which zsh)
	zsh
	xdotool key q
	clear
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions	
	source ~/.zshrc
}

echo "Happy Arching!"
sleep 3
clear
neofetch

