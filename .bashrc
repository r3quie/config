#
# ~/.bashrc
#

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
alias spac='sudo pacman -S'				#sudo pacman -S
alias cdgit='cd ~/"$GITDIR"/config'
alias hexit='hyprctl dispatch exit'
alias cdh='cd ~'
alias cdc='cd ~/.config'
alias pullconf='cdgit && git pull'

alias update='sudo pacman -Suy && yay -Suy'
alias mountPC='~/mountPC.sh' #mounts remote folder from local PC
alias updatedots='~/scripts/updatedots.sh'

alias footopa='sed -i 's/alpha=1/alpha=0.5/' ~/.config/foot/foot.ini'

# ufw
alias ufw='sudo ufw'					#auto sudo on ufw call
alias ufwsa='sudo ufw allow 22/tcp; sudo ufw allow 22'  #open SSH ports
alias ufwsd='sudo ufw deny 22/tcp; sudo ufw deny 22'    #close SSH ports

PS1='[\u@\h \W]\$ '
