function gitcheck {
    branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
    red=`tput setaf 1`
    green=`tput setaf 2`
    reset=`tput sgr0`
    NOCOLOR='\033[0m'
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    ORANGE='\033[0;33m'
    BLUE='\033[0;34m'
    PURPLE='\033[0;35m'
    CYAN='\033[0;36m'
    LIGHTGRAY='\033[0;37m'
    DARKGRAY='\033[1;30m'
    LIGHTRED='\033[1;31m'
    LIGHTGREEN='\033[1;32m'
    YELLOW='\033[1;33m'
    LIGHTBLUE='\033[1;34m'
    LIGHTPURPLE='\033[1;35m'
    LIGHTCYAN='\033[1;36m'
    WHITE='\033[1;37m'

    if [ -n "$branch" ]
    then
        modifiedCount=$(git status 2> /dev/null | grep 'modified:' -c)
        newfilesCount=$(git status 2> /dev/null | grep 'new file:' -c)
        untrackedCount=$(git status 2> /dev/null | grep '(use "git add <file>..." to include in what will be committed)' -A 100000 | wc -l)
        lastLineUntracked=$(git status 2> /dev/null | grep '(use "git add <file>..." to include in what will be committed)' -A 100000 | tail -n1)
        linesToCheck=2

        if [ "$lastLineUntracked" == 'no changes added to commit (use "git add" and/or "git commit -a")' ]
        then
            linesToCheck=3
        fi

        COLORBRANCH=$GREEN
        MODIFIEDS="";
        NEWFILES=""
        UNTRACKED=""

        if [ $modifiedCount -gt 0 ]
        then 
            COLORBRANCH=$YELLOW
        fi

        if [ $newfilesCount -gt 0 ]
        then 
            COLORBRANCH=$YELLOW
        fi

        if [ $untrackedCount -gt $linesToCheck ]
        then 
            COLORBRANCH=$YELLOW
        fi
        
        echo -e "${COLORBRANCH}($branch) ${MODIFIEDS}${NEWFILES}${UNTRACKED}${reset}"
    fi
}