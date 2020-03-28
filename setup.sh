#!/bin/sh

# Sets up this repo

# Install Vundle and all plugins
git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
vim +PluginInstall +qall

# Remove this file
rm -- "$0"
