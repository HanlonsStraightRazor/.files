#!/bin/sh

################################################################################
# Sets up or updates this repo.
################################################################################

# Install vim-plug and all plugins (if needed)
if [ ! -f 'autoload/plug.vim' ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
else
    # Update Vim configuration
    git pull
    # Update vim-plug and plugins and remove unused ones
    vim +PlugUpgrade +PlugClean! +PlugUpdate +qall
fi
