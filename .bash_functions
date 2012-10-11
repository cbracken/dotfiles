# gnome-gvim has a problem forking at startup with ibus running under gPrecise
function gvim {
    /usr/bin/gvim -f $* > /dev/null 2> /dev/null & disown
}
