#!/bin/bash

package=("nginx" "curl" "wget")

if [ $EUID -ne 0 ];then
       	echo "This script must be run as root";
	exit 1
else
	echo "Running as root"
fi

for pkg in "${package[@]}";do
	dpkg -s $pkg &>/dev/null || { echo "$pkg installing..."; apt install $pkg -y &>/dev/null; }
done

for pkg in "${package[@]}";do
         dpkg -s $pkg &>/dev/null && echo " STATUS - $pkg is INSTALLED " || echo " STATUS - $pkg is NOT INSTALLED "
done



