function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

starship init fish | source

# function fish_prompt
#   set_color cyan; echo (pwd) 
#   set_color green; echo '> '
# end

#### CUSTOM ####
source ~/scripts/.fifunctions.fish
pfetch

#### ALIAS ####
# everyday
alias clearn="clear; neofetch"
alias cdc="cd ~/.config/"
alias vimfish="vim .config/fish/config.fish"
alias sapt='sudo apt install'
alias cdgit='cd ~/"$GITDIR"/config'
alias hexit='hyprctl dispatch exit'
alias cdh='cd ~'
alias pullconf='cdgit && git pull'

alias update='yay -Suy && sudo apt update && sudo apt upgrade'
alias mountPC='~/mountPC.sh' #mounts remote folder from local PC
alias updatedots='~/scripts/updatedots.sh'

alias footopa='sed -i 's/alpha=1/alpha=0.5/' ~/.config/foot/foot.ini'

# ufw
alias ufw='sudo ufw'					#auto sudo on ufw call
alias ufwsa='sudo ufw allow 22/tcp; sudo ufw allow 22'  #open SSH ports
alias ufwsd='sudo ufw deny 22/tcp; sudo ufw deny 22'    #close SSH ports
