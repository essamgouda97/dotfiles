#!/bin/bash

set -eaxo pipefail

: ====== Install required packages ======
sudo apt-get install neovim tmux zsh fontconfig unzip -y

: ====== Install oh-my-zsh ======
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

: ====== Install zsh plugins ======
sudo apt-get install fonts-hack-ttf exa -y
echo "[-] Download fonts [-]"
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Lekton.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Lekton.zip
unzip Lekton.zip -d ~/.fonts
fc-cache -fv
echo "done!"

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf | ~/.fzf/install | true
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


: ====== ZSH THEME =====
curl -sS https://starship.rs/install.sh | sh
echo "Install Nerdfont on your terminal for full experience"
