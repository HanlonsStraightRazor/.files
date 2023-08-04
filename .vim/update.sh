#!/bin/bash

################################################################################
# Set up this directory or update plugins.
################################################################################

# Check if pip is installed
if [[ $(command -v pip) ]]
then
    # Install pywal if it's not already (needed for colorscheme)
    if [[ ! $(pip list | grep -E "^pywal\b") ]]
    then
        echo "Warning: pywal is not installed." >&2
        echo -n "Installing pywal..."
        message=$(pip install --user pywal 2>&1)
        if [[ $? ]]
        then
            echo "Done"
        else
            echo "Failed" >&2
            echo "Please install pywal manually." >&2
            echo "Error message:" >&2
            echo "$message" >&2
        fi
    fi
else
    echo "Warning: pip is not installed." >&2
    echo "Please install pip to use the correct colorscheme." >&2
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
