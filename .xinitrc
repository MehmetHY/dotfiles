userresources=$HOME/.Xresources
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

volumeicon&
nm-tray&
exec awesome
