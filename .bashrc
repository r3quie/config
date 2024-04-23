#
# ~/.bashrc
#

fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#### ON TERMINAL OPEN ####
source ~/scripts/.functions.sh
pfetch

#### ALIASES ####
# everyday
alias ls='ls --color=auto'				#ls
alias grep='grep --color=auto'  			#grep
alias clearn='clear; neofetch'				#clear + neofetch
alias sapt='sudo apt install'	
alias cdgit='cd ~/"$GITDIR"/config'
alias hexit='hyprctl dispatch exit'
alias cdh='cd ~'
alias cdc='cd ~/.config'
alias pullconf='cdgit && git pull'

alias update='yay -Suy && sudo apt update && sudo apt upgrade'
alias mountPC='~/mountPC.sh' #mounts remote folder from local PC
alias updatedots='~/scripts/updatedots.sh'

alias footopa='sed -i 's/alpha=1/alpha=0.5/' ~/.config/foot/foot.ini'

# ufw
alias ufw='sudo ufw'					#auto sudo on ufw call
alias ufwsa='sudo ufw allow 22/tcp; sudo ufw allow 22'  #open SSH ports
alias ufwsd='sudo ufw deny 22/tcp; sudo ufw deny 22'    #close SSH ports

PS1='[\u@\h \W]\$ '
