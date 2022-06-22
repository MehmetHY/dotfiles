# prompt	-----------------------------------------------------------------------------------------------------------
function append_to_prompt() {
	while [ -n "$1" ]
	do
		PS1="$PS1$1"
		shift
	done
}

function setup_prompt() {

# exit status of the last command
local exitCode="$?"

# git branch name
local branchName="$(git symbolic-ref --short -q HEAD 2> /dev/null)"

# root or user
local userId=$(id -u)

# format and colors
local reset="\e[0m"
local bold=$(tput bold)
local unbold=$(tput sgr0)
local black="\e[30m"
local red="\e[31m"
local green="\e[32m"
local yellow="\e[33m"
local blue="\e[34m"
local magenta="\e[35m"
local cyan="\e[36m"
local white="\e[37m"
local newline="\n"

# start
PS1=""

# directory
append_to_prompt $newline $cyan ' ' $blue '\w'

# git branch
[ -n "$branchName" ] && append_to_prompt $cyan '  ' $magenta $branchName

# user or root
[ $userId -eq 0 ] && append_to_prompt $yellow ' '

# exit code
[ $exitCode != "0" ] && append_to_prompt $red " 窱$exitCode"

# end
append_to_prompt $newline $green '\$ ' $reset


}

# callback
PROMPT_COMMAND=setup_prompt


# alias		-----------------------------------------------------------------------------------------------------------
alias ls="ls -FQ --color=always --group-directories-first"
alias la="ls -AFhQ --color=always --group-directories-first"
alias ll="ls -AFhlQ --color=always --group-directories-first"

alias ..="cd .."

alias cp="cp -irv"
alias cpn="cp -nrv"

alias mv="mv -iv"
alias mvn="mv -nv"

alias pacmans="pacman --color always -Ss"
alias pacmanq="pacman --color always -Qs"
alias pacmani="sudo pacman --color always --disable-download-timeout -S"
alias pacmanu="sudo pacman --color always --disable-download-timeout -Syu"

alias pamacs="pamac search -a"
alias pamacl="pamac list -i"
alias pamacv="pamac info -a"
alias pamaci="sudo pamac install"
alias pamacb="sudo pamac build --no-keep"
alias pamacu="sudo pamac upgrade -a"
alias pamaco="pamac list -o"
alias pamacc="sudo pamac clean"

alias rm="rm -v"
alias rmr="rm -rfv"

alias mkdir="mkdir -pv"
alias rmdir="rmdir -v --ignore-fail-on-non-empty"

alias vim="nvim"
alias vi="nvim"
alias nano="nvim"

alias findf="sudo find / -type f -nowarn -iname"
alias findd="sudo find / -type d -nowarn -iname"

# freecad outdated libc++
#LD_PRELOAD=/usr/lib/libstdc++.so #/opt/freecad/2022.04.30/freecad 
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/libstdc++.so
#export LD_PRELOAD=/usr/lib/libstdc++.so.6

