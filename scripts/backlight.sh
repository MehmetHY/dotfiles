#! /bin/bash

function backlightrun() {
    local maxPath=/sys/class/backlight/intel_backlight/max_brightness
    local curPath=/sys/class/backlight/intel_backlight/brightness

    local max=$(cat $maxPath)
    local min=4
    local current=$(cat $curPath)

    local ratio=$[$max / 100]
    local step=1

    local result

    case $1 in
        # get
        '-g')
            local percentage=$[$current / $ratio]
            [ $percentage -eq 0 ] && percentage=1
            [ $percentage -gt 100 ] && percentage=100

            echo $percentage 
            return 0;;

        # set
        '-s')
            if [ -z '$2' ]
            then
                echo 'usage: backlight -s <number>'
                return 2
            fi

            result=$[$2 * $ratio];;

        # add
        '-a')
            if [ -z '$2' ]
            then
                echo 'usage: backlight -a <number>'
                return 2
            fi

            local amount=$[$2 * $step]
            result=$[$current + $amount];;

        '-i')
            if [ -z '$2' ]
            then
                echo 'usage: backlight -i <number>'
                return 2
            fi

            local amount=$[$2 * $ratio]
            result=$[$current + $amount];;
        '-d')
            if [ -z '$2' ]
            then
                echo 'usage: backlight -d <number>'
                return 2
            fi

            local amount=$[$2 * $ratio]
            result=$[$current - $amount];;

        *)
            echo "usage:"
            echo
            echo "get percentage:"
            echo -e "\tbacklight -g"
            echo
            echo "set percentage:"
            echo -e "\tbacklight -s <number>"
            echo
            echo "increase percentage:"
            echo -e "\tbacklight -i <number>"
            echo
            echo "decrease percentage:"
            echo -e "\tbacklight -d <number>"
            echo
            echo "add hardware value:"
            echo -e "\tbacklight -a <number>"
            return 2;;
    esac

    if (( $result > $max ))
    then
        result=$max
    elif (( $result < $min ))
    then
        result=$min
    fi

    echo $result > $curPath
}

backlightrun $1 $2

exit $?