# path
export PATH=~/bin:$PATH

# python
export PATH=/usr/local/bin:$PATH

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pipenv
export PIPENV_VENV_IN_PROJECT=1

# alias
# list show
alias ls='ls -G'
alias ll='ls -l'
alias lla='ls -la'

# change directory
alias up='cd ..; ll'

# file change confirmation
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

alias watch='watchexec'
alias py='python3'
alias t='tmux'

# open google chrome
alias ggl='open -a google\ chrome'
alias google='open -a google\ chrome'

# ssh
alias ssh='~/bin/ssh-change-color.sh'

# color
export LSCOLORS=gxfxcxdxbxegedabagacad

if [ $UID -eq 0 ]; then
    PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[32m\]\w\[\033[00m\]\\$ "
else
    PS1="\[\033[33m\]\u@\h\[\033[00m\]:\[\033[32m\]\w\[\033[00m\]\\$ "
fi
