function backlight() {
    local maxPath=/sys/class/backlight/intel_backlight/max_brightness
    local curPath=/sys/class/backlight/intel_backlight/brightness

    local max=$(cat $maxPath)
    local min=4
    local current=$(cat $curPath)

    local step=4

    local result

    case $1 in
        # get
        '-g')
            echo $[$current / $step]
            return 0;;

        # set
        '-s')
            if [ -z '$2' ]
            then
                echo 'usage: backlight -s <number>'
                return 2
            fi

            result=$[$2 * $step];;

        # add
        '-a')
            if [ -z '$2' ]
            then
                echo 'usage: backlight -a <number>'
                return 2
            fi

            local amount=$[$2 * $step]
            result=$[$current + $amount];;

        *)
            echo 'usage:'
            echo 'backlight -g'
            echo 'backlight -s <number>'
            echo 'backlight -a <number>'
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

backlight $1 $2
