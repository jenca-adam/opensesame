#!/usr/bin/env sh
echo "Setting up..."
VERSION=$(python --version |awk --field-separator=" " '{ print $2}'|awk -F. '{print $1"."$2}')
if [ "$?" == "127" ]
        then
	echo "Python 3 not found! please install it."
	exit 1
   fi
echo "Python version is $VERSION"
echo "Trying setup.py install..."
sudo python3 setup.py install 2>>/dev/null
if [ "$?" == "1" ]
then
echo "No root! Installing locally."
python3 setup.py install --prefix="~/.local"
fi
