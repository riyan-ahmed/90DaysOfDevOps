#!/bin/bash

package=("nginx" "curl" "wget")


for pkg in "${package[@]}";do
	dpkg -s $pkg &>/dev/null || { echo "$pkg installing..."; apt install $pkg -y 1>/dev/null; }
done

for pkg in "${package[@]}";do
	 dpkg -s $pkg &>/dev/null && echo " STATUS - $pkg is INSTALLED " || echo " STATUS - $pkg is NOT INSTALLED "
done


