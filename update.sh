#!/bin/sh

################################################################################
# Updates this repo
################################################################################

# Pull new configuration changes
git pull

# Update plugins and remove unused ones
vim +PluginClean! +PluginInstall! +qall
