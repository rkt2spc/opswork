#!/bin/bash

sudo apt-get update
sudo apt-get install curl
sudo apt-get install git
sudo apt-get install zsh

# install oh-my-zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install awesome-terminal-fonts
git clone --single-branch -b patching-strategy https://github.com/gabrielelana/awesome-terminal-fonts.git
mkdir -p ~/.fonts
cp -af awesome-terminal-fonts/patched/. ~/.fonts
rm -rf awesome-terminal-fonts

# install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git
sudo mkdir -p ~/.oh-my-zsh/custom/themes/powerlevel9k
sudo cp -af powerlevel9k/. ~/.oh-my-zsh/custom/themes/powerlevel9k
rm -rf powerlevel9k

# install plugins
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# set theme
if [ ! -d opswork ]
then
  git clone https://github.com/rocketspacer/opswork.git
fi
sudo cp -f opswork/zsh/.zshrc ~/.zshrc
autoload -U compinit && compinit
rm -rf opswork

# set zsh as default shell
sudo chsh -s $(which zsh)
