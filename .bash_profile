################################################################################
# My .bash_profile
################################################################################

################################################################################
# Important
################################################################################

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

# Screen turns off after 15 minutes of inactivity
setterm --blank=15

################################################################################
# Environment Variables
################################################################################

# Less > more
export PAGER=less

# Vim's cool, so use that
export EDITOR=vim

# Add .scripts directory to path
export PATH=$PATH:$HOME/.scripts:$HOME/.local/bin

# Set login prompt
PS1='\[\e[1m\]\u@\h \W$ \[\e[0m\]'
