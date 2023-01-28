#!/bin/bash

set -eaxo pipefail

: ====== Install required packages ======
sudo apt-get install neovim tmux fish fonts-hack-ttf -y

: ====== Install fish plugins ======
omf install kawasaki
omf install z
