export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1="\[\033[01;36m\]\w\[\033[00m\] "
export EDITOR=/usr/bin/nano

alias ls='ls -l'
alias finder='open -a Finder ./'
alias desktop="cd ~/desktop"
alias work="cd ~/work"

function resetcam {
    sudo killall VDCAssistant
}
function kubeoff {
    clear
    source ~/.kubeoff
}
function kubeon {
    clear
    source ~/.kubeon
}
function listaws {
    cat ~/.aws/credentials
}