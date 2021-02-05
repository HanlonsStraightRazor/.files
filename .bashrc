################################################################################
# My .bashrc
################################################################################

################################################################################
# Important
################################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

################################################################################
# Aliases
################################################################################

# 3 characters = too much typing
alias v='vim'

# Update all pip packages
alias pip-update='pip list --outdated --format=freeze | grep -v "^\-e" | cut -d = -f 1 | xargs -n1 pip install -U --user'

# Colorful ls
alias ls='ls --color=auto'

# Colorful long ls w/ hidden files
alias ll='ls --color=auto -lAh'

# Colorful long ls w/o hidden files
alias lsl='ls --color=auto -lh'

# Always run df with -h
alias df='df -h'

# Load .Xresources
alias xup='xrdb ~/.Xresources'

# Dotfiles bare repo
alias dot='/usr/bin/git --git-dir=$HOME/.files --work-tree=$HOME'

################################################################################
# Shell Prompt (starship)
################################################################################

# Set prompt (disabled for now)
# if [ `command -v starship` ]
# then
#   eval "$(starship init bash)"
# else
#  PS1='\[\e[1m\]\u@\h \W$ \[\e[0m\]'
# fi

################################################################################
# Other Stuff
################################################################################

# For fzf completions
source /usr/share/bash-completion/completions/fzf
source /usr/share/fzf/key-bindings.bash
