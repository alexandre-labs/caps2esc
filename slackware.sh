#!/bin/sh


git submodule update --init --recursive
cd xcape
git checkout master && git pull origin master
make
sudo make install

cd ..

echo "Copying xmodconf file"
cp xmodmap.conf ${HOME}/.xmodmap.conf

echo "Copying caps2esc"
cp caps2esc ${HOME}/.
chmod +x ${HOME}/caps2esc

echo "Do you wanna activate it now? [Y/N]"
read activate_now

case ${activate_now} in
	Y)
		. ${HOME}/caps2esc
		echo "Done!";
		echo "Press any key"
		read foo
		;;
	N)
		echo "Ok, execute the file ${HOME}/caps2esc whenever you want. =]"
		echo "Press any key"
		read foo
		;;
	*)
		echo "Invalid Option. I won't activate it now. Execute '. ~/caps2esc'";
		echo "Press any key"
		read foo
esac
