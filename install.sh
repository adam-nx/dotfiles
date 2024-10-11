#!/bin/bash
set -e

sudo apt install --yes \
	build-essential \
	curl \
	feh \
	gimp \
	git \
	git-lfs \
	i3 \
	picom \
	ripgrep \
	ruby \
	stow \
	tmux \
	tree \
	xclip \
	zsh

chsh -s /usr/bin/zsh
curl -sS https://starship.rs/install.sh | sh

git clone https://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh

unzip VictorMono.zip -d VictorMono
sudo mkdir -p /usr/local/share/fonts/truetype
sudo cp VictorMono/*.ttf /usr/local/share/fonts/truetype
sudo fc-cache -fv
rm -rf VictorMono/

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
