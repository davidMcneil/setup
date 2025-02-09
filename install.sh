#!/usr/bin/env bash

sudo apt install brave
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt install alacritty
# zellij
sudo apt install fish
chsh -s $(which fish)
curl -sS https://starship.rs/install.sh | sh
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
sudo apt install git

