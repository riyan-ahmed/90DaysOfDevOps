#!/bin/bash

check_disk(){
	echo "Disk usage of \\ : "
	df -h | awk 'NR==3{print "Total:" $2," Used:" $3," Available:"$4}'
}

check_memory(){
	echo "Free memory : "
	free -h | awk 'NR==2{print $7}'
}

main(){
	check_disk
	check_memory
}
main
