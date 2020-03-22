#!/bin/sh
git pull
vim +PluginClean! +PluginInstall! +qall
