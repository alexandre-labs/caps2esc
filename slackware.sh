#!/bin/sh


git submodule init --update --recursive
cd xcape
make
su -c make install

echo "Copying xmodconf file"
cp ./.xmodmap.conf ${HOME}/.xmodmap.conf

echo "Do you wanna activate it now? [Y/N]"
read activate_now

case activate_now in
	Y||y )
		;;
	N||n )
		;;
	* )
		echo "Invalid Option. I'll decide not activate it now. Execute '. ~/caps2esc'";
		exit 1;
esac
