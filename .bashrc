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

# ufw
alias ufw='sudo ufw'					#auto sudo on ufw call
alias ufwsa='sudo ufw allow 22/tcp; sudo ufw allow 22'  #open SSH ports
alias ufwsd='sudo ufw deny 22/tcp; sudo ufw deny 22'    #close SSH ports

PS1='[\u@\h \W]\$ '
