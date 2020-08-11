# path
export PATH=~/bin:$PATH

# alias
alias ls='ls -G'
alias ll='ls -l'
alias lla='ls -la'

alias up='cd ..; ll'

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

alias py='python3'

alias ggl='open -a google\ chrome'

# color
export LSCOLORS=gxfxcxdxbxegedabagacad

if [ $UID -eq 0 ]; then
    PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[32m\]\w\[\033[00m\]\\$ "
else
    PS1="\[\033[33m\]\u@\h\[\033[00m\]:\[\033[32m\]\w\[\033[00m\]\\$ "
fi
