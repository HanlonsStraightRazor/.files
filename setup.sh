#!/bin/sh

################################################################################
# Sets up this repo
################################################################################

# Install Vundle and all plugins
git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
vim +PluginInstall +qall

# Add .gitignore and add this and bundle to it
echo bundle > .gitignore
echo setup.sh >> .gitignore

# Remove this file
rm -- "$0"
