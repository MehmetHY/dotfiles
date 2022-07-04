export PATH="$PATH:$HOME/.emacs.d/bin"
export QT_QPA_PLATFORMTHEME="qt5ct"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh_plugins.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mhy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ "$TERM" = "linux" ]; then
	printf %b '\e[40m' '\e[8]' # set default background to color 0 'dracula-bg'
	printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'dracula-fg'
	printf %b '\e]P0282a36'    # redefine 'black'          as 'dracula-bg'
	printf %b '\e]P86272a4'    # redefine 'bright-black'   as 'dracula-comment'
	printf %b '\e]P1ff5555'    # redefine 'red'            as 'dracula-red'
	printf %b '\e]P9ff7777'    # redefine 'bright-red'     as '#ff7777'
	printf %b '\e]P250fa7b'    # redefine 'green'          as 'dracula-green'
	printf %b '\e]PA70fa9b'    # redefine 'bright-green'   as '#70fa9b'
	printf %b '\e]P3f1fa8c'    # redefine 'brown'          as 'dracula-yellow'
	printf %b '\e]PBffb86c'    # redefine 'bright-brown'   as 'dracula-orange'
	printf %b '\e]P4bd93f9'    # redefine 'blue'           as 'dracula-purple'
	printf %b '\e]PCcfa9ff'    # redefine 'bright-blue'    as '#cfa9ff'
	printf %b '\e]P5ff79c6'    # redefine 'magenta'        as 'dracula-pink'
	printf %b '\e]PDff88e8'    # redefine 'bright-magenta' as '#ff88e8'
	printf %b '\e]P68be9fd'    # redefine 'cyan'           as 'dracula-cyan'
	printf %b '\e]PE97e2ff'    # redefine 'bright-cyan'    as '#97e2ff'
	printf %b '\e]P7f8f8f2'    # redefine 'white'          as 'dracula-fg'
	printf %b '\e]PFffffff'    # redefine 'bright-white'   as '#ffffff'
	clear
fi


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
alias pacmanr="sudo pacman --color always -R"
# remove with dependencies
alias pacmanrc="sudo pacman --color always -Rc"
# clean
alias pacmanc="sudo pacman --color always -Sc"

alias pamacs="pamac search -a"
alias pamacl="pamac list -i"
alias pamacv="pamac info -a"
alias pamaci="sudo pamac install"
alias pamacb="sudo pamac build --no-keep"
alias pamacu="sudo pamac upgrade -a"
alias pamaco="pamac list -o"
alias pamacc="sudo pamac clean"

alias aptget="sudo apt-fast install"
alias aptgrade="sudo apt-fast update && sudo apt-fast upgrade"
alias aptup="sudo apt-fast update"

alias grep='grep --color=auto'

alias rm="rm -v"
alias rmr="rm -rfv"

alias mkdir="mkdir -pv"
alias rmdir="rmdir -v --ignore-fail-on-non-empty"

alias vim="nvim"
alias vi="nvim"
alias nano="nvim"

alias findf="sudo find / -type f -nowarn -iname"
alias findd="sudo find / -type d -nowarn -iname"

alias aria2c="aria2c -x 16 -s 16 -j 16 -m 0 -t 1800"
