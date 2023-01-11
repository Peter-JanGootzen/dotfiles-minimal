#!/bin/bash

# Neovim and Friends
if [[ $(uname -a) == *"ubuntu"* ]]; then
	sudo add-apt-repository -y ppa:neovim-ppa/stable
	sudo apt-get -y update
	sudo apt-get -y install neovim
	
	sudo apt-get install -y bear ripgrep gdb npm zip unzip libc-dev-bin
fi
if [[ $(uname -a) == *"arch"* ]]; then
	sudo pacman -Syu --noconfirm

	sudo pacman -S gradle java-11-openjdk --noconfirm
	sudo pacman -S neovim git cmake ninja meson clang qemu-base llvm \
		lld bear ripgrep gdb npm zip unzip --noconfirm
	sudo pacman -S gradle java-11-openjdk --noconfirm
	sudo pacman -S htop dos2unix tcpdump bc rpcsvc-proto --noconfirm
fi

# General setup
## SSH
cp /home/vagrant/.host_ssh/config /home/vagrant/.ssh
cp -r /home/vagrant/.host_ssh/keys /home/vagrant/.ssh

## Neovim setup
mkdir -p /home/vagrant/.config/nvim
ln -s /home/vagrant/h/Code/dotfiles-minimal/nvim/init.lua /home/vagrant/.config/nvim/init.lua

## Git setup
git config --global user.email "peter-jan@gootzen.net"
git config --global user.name "Peter-Jan Gootzen"
