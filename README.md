# caps2esc

# TODO: improve this README.md

__The original gist (https://gist.github.com/oblitum/eafd75ba94a272fbf31e):__

_This recipe maps the useless CapsLock key to a combo key, that works
as ESC when clicked, or as CTRL when pressed in combination with another
key.

On Linux you should just execute the xcape tool without any arguments:

https://github.com/alols/xcape

and xmodmap using the provided xmodmap file as parameter.

On Arch with xmodmap installed, one just needs to edit the /etc/X11/Xmodmap
file and it'll be loaded by xmodmap when the system starts, so only xcape
needs to be added to the list of session applications. On Ubuntu the experience
of the xmodmap installation is not as seamless, it won't be loaded at startup
by default and read default configuration files from the system. So both
xcape as xmodmap must be added as session applications, and the configuration
file must be passed as argument to xmodmap (e.g. xmodmap <conf-file>).

On Ubuntu notice that when you change keyboard layout the tools must be re-executed.
Also, for me at last, putting the tools as session applications was never stable,
sometimes it was mapped, somewhat not, no idea, there's a problem with Ubuntu.

So, on Ubuntu in truth I have a simple bash script named caps2esc that I execute
myself from console when I login. It has just two lines, xcape and xmodmap <xmodmap-conf-file>.

Notice that this also maps ESC to CapsLock.

On OS X I go to system-preferences>keyboard>modifier-keys and map Caps Lock to Control.

I then use the Karabiner (https://pqrs.org/osx/karabiner/index.html.en) tool and mark
the Ctrl_L to Ctrl\_L option where it's specified: "+ When you type Ctrl\_L only, send Escape".
_

