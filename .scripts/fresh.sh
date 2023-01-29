#!/bin/bash

set -eaxo pipefail

: ====== Install required packages ======
sudo apt-get install neovim tmux fish -y

: ====== Install fish plugins ======
omf install kawasaki
omf install z
sudo apt-get install peco fonts-hack-ttf -y
