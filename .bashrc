#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#### ON TERMINAL OPEN ####
pfetch
./runpacman.sh

#### ALIASES ####
# everyday
alias ls='ls --color=auto'				#ls
alias grep='grep --color=auto'  			#grep
alias clearn='clear; neofetch'				#clear + neofetch
alias spac='sudo pacman -S'				#sudo pacman -S
alias cdgit='cd ~/git\ repos/config'

alias update='./update.sh' #full system update, interactive
alias copyall='./copyall.sh' #copy from local repo

alias footopa='sed -i 's/alpha=1/alpha=0.3/' ~/.config/foot/foot.ini'

# ufw
alias ufw='sudo ufw'					#auto sudo on ufw call
alias ufwsa='sudo ufw allow 22/tcp; sudo ufw allow 22'  #open SSH ports
alias ufwsd='sudo ufw deny 22/tcp; sudo ufw deny 22'    #close SSH ports

PS1='[\u@\h \W]\$ '
