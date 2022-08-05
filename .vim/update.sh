#!/bin/bash

################################################################################
# Set up this directory or update plugins.
################################################################################

# Check if pip is installed
if [[ $(command -v pip) ]]
then
    # Install pywal if it's not already (needed for colorscheme)
    if [[ ! $(pip list | grep -E "^pywal") ]]
    then
        pip install --user pywal
    fi
fi

# Install vim-plug and install or update plugins
if [[ ! -f 'autoload/plug.vim' ]]
then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
else
    vim +PlugUpgrade +PlugClean! +PlugUpdate +qall
fi
