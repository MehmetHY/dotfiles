#!/bin/bash
clear


# globals           ------------------------------------------------------------
reset="\e[0m"
bold=$(tput bold)
unbold=$(tput sgr0)
black="\e[30m"
red="\e[31m"
green="\e[32m"
yellow="\e[33m"
blue="\e[34m"
magenta="\e[35m"
cyan="\e[36m"
white="\e[37m"
newline="\n"

packageManagerName=""


# functions         ------------------------------------------------------------
function main() {
    mainPage
}

function prt() {
    local msg=""

    while [ -n "$1" ]
    do
        msg+="$1"
        shift
    done

    echo -e $msg
}

function mainPage() {
    clear
    packageManagerName=""
    prt $reset
    prt "Welcome to " $magenta "PacMac"
    prt
    prt $yellow "1" $reset " - pacman"
    prt $yellow "2" $reset " - pamac"
    prt
    prt $red "q" $reset " - quit"
    prt

    while [ -z "$packageManagerName" ]
    do
        read -sn1

        case $REPLY in
        1) packageManagerName="pacman";;
        2) packageManagerName="pamac";;
        q) clear; exit 0;;
        esac
    done

    packagePage
}

function packagePage() {
    clear
    prt $reset
    prt $yellow "$packageManagerName"
    prt
    prt $yellow "u" $reset " - update"
    prt $yellow "i" $reset " - install"
    prt $yellow "s" $reset " - search"
    prt
    prt $magenta "b" $reset " - back"
    prt $red "q" $reset " - quit"
    prt

    local valid=0

    while [ $valid -eq 0 ]
    do
        read -sn1

        case $REPLY in
        u) valid=1; updatePage;;
        i) valid=1; installPage;;
        s) valid=1; searchPage;;
        b) mainPage;;
        q) clear; exit 0;;
        esac
    done
}

function updatePage() {
    clear
    prt $reset

    case $packageManagerName in
    "pacman")
        clear
        sudo pacman --color always --disable-download-timeout -Syu;;
    "pamac")
        clear
        sudo pamac upgrade -a;;
    esac

    prt $reset
    prt $cyan "press any key to continue"
    read -sn1
    packagePage
}

function installPage() {
    clear
    prt $reset

    local pkg
    read -p "enter package name: " pkg

    case $packageManagerName in
    "pacman")
        clear
        sudo pacman --color always --disable-download-timeout -S $pkg;;
    "pamac")
        clear
        sudo pamac install;;
    esac

    prt $reset
    prt $cyan "press any key to continue"
    read -sn1
    packagePage
}

function searchPage() {
    clear
    prt $reset

    local pkg
    read -p "enter search text: " pkg

    case $packageManagerName in
    "pacman")
        clear
        pacman --color always -Ss $pkg;;
    "pamac")
        clear
        pamac search -a $pkg;;
    esac

    prt $reset
    prt $cyan "press any key to continue"
    read -sn1
    packagePage
}


main


# unset globals     ------------------------------------------------------------
unset reset
unset bold
unset unbold
unset black
unset red
unset green
unset yellow
unset blue
unset magenta
unset cyan
unset white
unset newline

unset packageManagerName

unset main
unset prt
unset mainPage
unset packagePage
unset updatePage
unset installPage
unset searchPage