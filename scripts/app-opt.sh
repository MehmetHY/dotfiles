#!/bin/bash


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
tab="\t"

inputFile=""
execName=""
appVersion=""
fullName=""
genericName=""
comment=""
keywords=""
icon=""
categories=""


# functions         ------------------------------------------------------------
function main() {
    inputFile="$1"

    ensureSuperUser
    validateFile

    clear

    askExecName
    askVersion
    askFullName
    askGenericName
    askComment
    askCategories
    askIcon
    askKeywords
    showSummary
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

function ensureSuperUser() {
    if [ $(id -u) -ne 0 ]
    then
        echo "run as super user"
        echo "usage: sudo apt-opt <file>"
        exit 2
    fi
}

function validateFile() {
    if [ -z "$inputFile" ]
    then
        echo "needs a file input"
        echo "usage: apt-opt <file>"
        exit 2
    fi

    if [ ! -e "$inputFile" ]
    then
        echo "'$inputFile' not found"
        exit 2
    fi

    if [ ! -f "$inputFile" ]
    then
        echo "'$inputFile' is not a file"
        exit 2
    fi

    if [ ! -x "$inputFile" ]
    then
        chmod +x "$inputFile"
    fi
}

function askExecName() {
    execName=""

    while [ -z "$execName" ]
    do
        clear
        prt $reset
        prt $magenta "Executable Name"
        prt $reset $newline
        prt $cyan "example: " $reset "blender"
        prt

        if [ "$1" = "-e" ] && [ -n "$2" ]
        then
            prt $red "$2" $reset
            shift
        fi

        read -p "enter executable name: " execName
    done

    local err=$(binaryExists)

    if [ -n "$err" ]
    then
        askExecName -e "$err"
    fi

    if [ "$1" = "-u" ]
    then
        showSummary
    fi
}

function askVersion() {
    appVersion=""

    while [ -z "$appVersion" ]
    do
        clear
        prt $reset
        prt $magenta "Version"
        prt $reset $newline
        prt $cyan "example: " $reset "3.2.1"
        prt

        if [ "$1" = "-e" ] && [ -n "$2" ]
        then
            prt $red "$2" $reset
            shift
        fi

        read -p "enter version: " appVersion
    done

    local err=$(versionExists)

    if [ -n "$err" ]
    then
        askVersion -e "$err"
    fi

    if [ "$1" = "-u" ]
    then
        showSummary
    fi
}

function binaryExists() {
    local msg=""
    local IFSold="$IFS"
    IFS=":"

    for dir in $PATH
    do
        if [ -e "$dir/$execName" ]
        then
            msg="$dir/$execName already exists"
        fi
    done

    IFS="$IFSold"
    echo "$msg"
}

function versionExists() {
    local msg=""

    if [ -d "/opt/$execName/$appVersion" ]
    then
        msg="Version '$appVersion' already exists"
    fi

    echo $msg
}

function askFullName() {
    fullName=""

    while [ -z "$fullName" ]
    do
        clear
        prt $reset
        prt $magenta "Full Name"
        prt $reset $newline
        prt $cyan "example: " $reset "Blender 3.2"
        prt
        read -p "enter full name: " fullName
    done

    if [ "$1" = "-u" ]
    then
        showSummary
    fi
}

function askGenericName() {
    genericName=""

    while [ -z "$genericName" ]
    do
        clear
        prt $reset
        prt $magenta "Generic Name"
        prt $reset $newline
        prt $cyan "example: " $reset "3D Modeler"
        prt
        read -p "enter generic name: " genericName
    done

    if [ "$1" = "-u" ]
    then
        showSummary
    fi
}

function askComment() {
    comment=""

    while [ -z "$comment" ]
    do
        clear
        prt $reset
        prt $magenta "Comment"
        prt $reset $newline
        prt $cyan "example: " $reset "a 3D modeling application"
        prt
        read -p "enter comment: " comment
    done

    if [ "$1" = "-u" ]
    then
        showSummary
    fi
}

function askKeywords() {
    keywords=""

    while [ -z "$keywords" ]
    do
        clear
        prt $reset
        prt $magenta "Keywords"
        prt $reset $newline
        prt $cyan "example: " $reset "3d;modeling;animation;painting;"
        prt
        read -p "enter keywods: " keywords
    done

    if [ "$1" = "-u" ]
    then
        showSummary
    fi
}

function askIcon() {
    icon=""

    while [ -z "$icon" ]
    do
        clear
        prt $reset
        prt $magenta "Icon"
        prt $reset $newline
        prt $cyan "example: " $reset "/usr/share/icons/user/blender.svg"
        prt
        read -p "enter icon: " icon
    done

    if [ "$1" = "-u" ]
    then
        showSummary
    fi
}

function askCategories() {
    categories=""

    while [ -z "$categories" ]
    do
        clear
        prt $reset
        prt $magenta "Categories"
        prt $reset $newline
        prt $cyan "example: " $reset "Graphics;3DGraphics;Development;"
        prt
        read -p "enter categories: " categories
    done

    if [ "$1" = "-u" ]
    then
        showSummary
    fi
}

function showSummary() {
    clear
    prt $reset
    prt $magenta "Summary"
    prt $reset $newline

    printf "$blue%s$yellow%s$blue%s $cyan%-16s%s$reset%s\n" "press " "1" " to edit " "executable name" ": " "$execName"
    printf "$blue%s$yellow%s$blue%s $cyan%-16s%s$reset%s\n" "press " "2" " to edit " "version" ": " "$appVersion"
    printf "$blue%s$yellow%s$blue%s $cyan%-16s%s$reset%s\n" "press " "3" " to edit " "full name" ": " "$fullName"
    printf "$blue%s$yellow%s$blue%s $cyan%-16s%s$reset%s\n" "press " "4" " to edit " "generic name" ": " "$genericName"
    printf "$blue%s$yellow%s$blue%s $cyan%-16s%s$reset%s\n" "press " "5" " to edit " "comment" ": " "$comment"
    printf "$blue%s$yellow%s$blue%s $cyan%-16s%s$reset%s\n" "press " "6" " to edit " "categories" ": " "$categories"
    printf "$blue%s$yellow%s$blue%s $cyan%-16s%s$reset%s\n" "press " "7" " to edit " "icon" ": " "$icon"
    printf "$blue%s$yellow%s$blue%s $cyan%-16s%s$reset%s\n" "press " "8" " to edit " "keywords" ": " "$keywords"

    prt $newline $reset
    prt $green "c" $reset " - continue"
    prt $yellow "r" $reset " - restart"
    prt $red "q" $reset " - quit"

    local validKey=0

    while [ $validKey -eq 0 ]
    do
        read -sn1
        validKey=1

        case $REPLY in
        1)
            askExecName -u;;
        2)
            askVersion -u;;
        3)
            askFullName -u;;
        4)
            askGenericName -u;;
        5)
            askComment -u;;
        6)
            askCategories -u;;
        7)
            askIcon -u;;
        8)
            askKeywords -u;;
        c)
            putIntoOpt;;
        r)
            main;;
        q)
            quit-app-opt;;
        *)
            validKey=0;;
        esac
    done
}

function putIntoOpt() {
    clear
    prt $reset

    local dir="/opt/$execName/$appVersion"
    local file="$dir/$execName"

    # create directory
    [ ! -d "$dir" ] && mkdir -p "$dir"
    [ $? -ne 0 ] && exit 1

    ptr $blue "in progress..." $reset
    # move and rename file
    mv "$inputFile" "$file"
    [ $? -ne 0 ] && exit 1

    putIntoBin "$file"
}

function putIntoBin() {
    local file="$1"
    ln -s "$file" "/usr/bin/$execName"

    [ $? -ne 0 ] && exit 1

    createDesktopFile
}

function createDesktopFile() {
    local file="/usr/share/applications/${execName}.desktop"

    echo "[Desktop Entry]" > "$file"
    echo "Name=$fullName" >> "$file"
    echo "GenericName=$genericName" >> "$file"
    echo "Comment=$comment" >> "$file"
    echo "Keywords=$keywords" >> "$file"
    echo "Exec=$execName" >> "$file"
    echo "Icon=$icon" >> "$file"
    echo "Categories=$categories" >> "$file"

    clear
    prt $reset
    prt $green "Success!"
    prt $reset

    quit-app-opt
}

function quit-app-opt() {
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
    unset tab

    unset inputFile
    unset execName
    unset appVersion
    unset fullName
    unset genericName
    unset comment
    unset keywords
    unset icon
    unset categories

    unset main
    unset prt
    unset ensureSuperUser
    unset validateFile
    unset askExecName
    unset askVersion
    unset binaryExists
    unset versionExists
    unset askFullName
    unset askGenericName
    unset askComment
    unset askCategories
    unset askIcon
    unset askKeywords
    unset showSummary
    unset putIntoOpt
    unset putIntoBin
    unset createDesktopFile

    exit 0
}


# start             ------------------------------------------------------------
main "$1"