################################################################################
# Environment Variables
################################################################################

# Less > more
export PAGER=less

# Vim's cool, so use that
export EDITOR=vim

# Use URXVT as the default terminal emulator
export TERMINAL=urxvt

# Add .scripts directory to path
export PATH=$PATH:$HOME/.scripts:$HOME/.local/bin

# Fix Vim colors
export USRRESOURCES=$HOME/.Xresources

# Theme QT apps with qt5ct
export QT_QPA_PLATFORMTHEME=qt5ct

# Set login prompt
PS1='\[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '

################################################################################
# Other
################################################################################

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
  . ~/.bashrc
fi
