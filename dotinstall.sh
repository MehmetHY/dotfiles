#!/bin/bash

function linkDotfiles() {
    local dotRoot="$(realpath -s $1)"

    if [ ! -e "$2" ]
    then
        mkdir -p "$2"
    fi

    local targetDir="$(realpath -s $2)"

    local dotfile=${dotRoot}/.dotfiles

    if [ -r "$dotfile" ]
    then
        local content=$(cat "$dotfile")

        for element in $content
        do
            local original=$(realpath -s ${dotRoot}/$element)
            local link=$(realpath -s ${targetDir}/$element)

            if [ -e "$link" ]
            then
                read -sn1 -p "$link already exists. overwrite? y/N"
                echo

                case "$REPLY" in
                    "y")
                        rm -rf "$link";;
                    *)
                        echo "skipped: $link"
                        continue;;
                esac
            fi

            ln -s "$original" "$link" 
        done
    fi

    for dir in $dotRoot/* $dotRoot/.*
    do
        local base=$(basename $dir) 

        if [ ! -d "$dir" ] || [ "$base" = '.' ] || [ "$base" = '..' ]
        then
            continue
        fi

        linkDotfiles "$dir" "${targetDir}/${base}"
    done
}

dotfilespath=$1

if [ -z "$1" ]
then
    dotfilespath=$(dirname $0)
fi

linkDotfiles "$dotfilespath" "$HOME"