# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


source ~/.git-completion.bash
# User specific aliases and functions
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' -e 's/((/(/' -e 's/))/)/'
}
function proml {
    PS1="[\t] [\u@\h:\033[32m\W\033[0m\033[33m\$(parse_git_branch)\033[0m]$ "
}
proml

function ssh {
    if [[ $# -gt 1 ]] || [[ "x$@x" =~ "@" ]] || [[ "x$1x" = "xrelayx" ]]
    then
        /usr/bin/ssh $@
        return
    fi

    if [ $1 = web-fe01 ]
    then
        /usr/bin/ssh -tt relay ssh web-fe01
        return
    fi

    /usr/bin/ssh -tt relay ssh -tt $1 sudo -usankuai -i
}
alias sshb=/usr/bin/ssh
export EDITOR=vim 
