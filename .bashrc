################################################################################
# Important
################################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Needed for gpg-agent
export GPG_TTY=$(tty)

################################################################################
# Aliases
################################################################################

# Standard abbreviations
alias v='vim'
alias r='ranger'
alias z='zathura'

# Default flags
alias df='df -h'
alias du='du -h'
alias ls='ls --color=always'
alias less='less -R'

# Special abbreviations
alias ll='ls --color=always -lAh' # w/ hidden files
alias lsl='ls --color=always -lh' # w/o hidden files
alias xup='xrdb ~/.Xresources'
alias keys='gpg --list-keys --fingerprint --fingerprint --keyid-format=long'
alias dotfiles='git --git-dir="$HOME/.files" --work-tree="$HOME"'

################################################################################
# Miscellaneous
################################################################################

# For fzf completions
if [[ -e "/usr/share/bash-completion/completions/fzf" &&
        -e "/usr/share/fzf/key-bindings.bash" ]]
then
    source /usr/share/bash-completion/completions/fzf
    source /usr/share/fzf/key-bindings.bash
fi

# Configure command correction
if [[ $(command -v thefuck) ]]
then
    eval "$(thefuck --alias)"
fi
