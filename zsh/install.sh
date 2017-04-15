#!/bin/bash

apt-get install curl
apt-get install git
apt-get install zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install awesome-terminal-fonts
git clone --single-branch -b patching-strategy https://github.com/gabrielelana/awesome-terminal-fonts.git
cp -ai awesome-terminal-fonts/patched/. ~/.fonts
rm -r awesome-terminal-fonts

# install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# set theme
git clone https://github.com/rocketspacer/opswork.git
cp -i opswork/zsh/.zshrc ~/.zshrc
