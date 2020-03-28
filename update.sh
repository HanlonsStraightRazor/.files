#!/bin/sh

# Updates this repo and plugins

git pull
vim +PluginClean! +PluginInstall! +qall

exit 0
