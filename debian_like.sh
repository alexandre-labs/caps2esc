#!/bin/sh
# it works! Ubuntu 14.10 64

echo "Cloning Xcape"
git submodule update --init --recursive

echo "Installing requirements - I'll need sudo"
cd xcape
git checkout master && git pull origin master
sudo apt-get install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev

echo "Building and install"
make
sudo make install
cd ..

echo "Copying xmodconf file"
cp xmodmap.conf ${HOME}/.xmodmap.conf

echo "Copying caps2esc"
cp caps2esc ${HOME}/caps2esc
chmod +x ${HOME}/caps2esc

echo "Do you wanna activate it now? [Y/N]"
read activate_now

case ${activate_now} in
	Y)
		. ${HOME}/caps2esc
		echo "Done!"
		echo "Press any key"
		read foo
		;;
	N)
		echo "Ok, execute the file ${HOME}/caps2esc whenever you want."
		echo "Press any key"
		read foo
		;;
	*)
		echo "Invalid Option. I will not activate it now. Execute '. ${HOME}/caps2esc'";
		echo "Press any key"
		read foo
esac
