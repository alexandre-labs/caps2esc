#!/bin/sh


git submodule init --update --recursive
cd xcape
make
su -c make install

echo "Copying xmodconf file"
cp ./.xmodmap.conf ${HOME}/.xmodmap.conf

echo "Copying caps2esc"
cp ./caps2esc ${HOME}/.
chmod +x ${HOME}/caps2esc

echo "Do you wanna activate it now? [Y/N]"
read activate_now

case activate_now in
	Y|y )
		. ${HOME}/caps2esc
		echo "Done!";
		;;
	N|n )
		echo "Ok, execute the file ${HOME}/caps2esc whenever you want. =]"
		;;
	* )
		echo "Invalid Option. I won't activate it now. Execute '. ~/caps2esc'";
		exit 1;
esac
