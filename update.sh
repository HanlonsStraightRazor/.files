#!/bin/bash

################################################################################
# Sets up or updates this repo.
################################################################################


# Install Vundle and all plugins (if needed)
if [ ! -d bundle ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim
  vim +PluginInstall +qall
else
  # Pull new configuration changes
  git pull
  # Update plugins and remove unused ones
  vim +PluginClean! +PluginInstall! +qall
fi

