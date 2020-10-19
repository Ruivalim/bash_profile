.  ~/.gitcheck.sh

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1="\[\033[01;36m\]\w\[\033[00m\] \$(gitcheck)"
export EDITOR=/usr/bin/nano

alias ls='ls -la'
alias finder='open -a Finder ./'
alias desktop="cd ~/desktop"
alias work="cd ~/work"
alias whoops="git reset --hard"

function resetcam {
    sudo killall VDCAssistant
}
function kubeoff {
    source ~/.kubeoff
}
function kubeon {
    source ~/.kubeon
}
function listaws {
    cat ~/.aws/credentials
}