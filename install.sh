#!/bin/bash

#save files
sh ~/dotfiles/backup_files.sh

pacman -S --needed --noconfirm git base-devel

# install yay package manager
cd
mkdir yay-install-folder
cd yay-install-folder
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si
cd
rm -rf yay-install-folder

# install oh my zsh
cd
cp -f ./dotfiles/.zshrc .
yay -S --noconfirm zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh 

# install display server
cd
cp -f ./dotfiles/.xinitrc .
yay -S --noconfirm xorg
yay -S --noconfirm xorg-xinit

# install window manager
# yay -S i3
yay -S --noconfirm firefox
yay -S --noconfirm kitty
