#!/bin/sh


echo "Cloning Xcape"
git submodule init --update --recursive

echo "Installing requirements - I'll need sudo"
cd xcape
sudo apt-get install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev

echo "Building and install"
make
sudo make install

echo "Copying xmodconf file"
cp ./.xmodmap.conf ${HOME}/.xmodmap.conf

echo "Copying caps2esc"
cp ./caps2esc ${HOME}/caps2esc
chmod +x ${HOME}/caps2esc

echo "Do you wanna activate it now? [Y/N]"
read activate_now

case activate_now in
	Y|y )
		. ${HOME}/caps2esc
		echo "Done!"
		;;
	N|n )
		echo "Ok, execute the file ${HOME} whenever you want."
		;;
	* )
		echo "Invalid Option. I'll decide not activate it now. Execute '. ${HOME}/caps2esc'";
		exit 1;
esac
