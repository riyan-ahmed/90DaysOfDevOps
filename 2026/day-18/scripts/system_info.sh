#!/bin/bash
set -euo pipefail
sys_info(){
	echo "=============== HOST NAME & SYS INFO =================="
	echo "HostName : $(hostname)"
	echo "Kernel   : $(uname -r)"
	echo "OS       : $(grep -E '^(NAME|VERSION)=' /etc/os-release)"
}

sys_uptime(){
	echo -e "\n=============== SYSTEM UPTIME ========================="
	uptime -p
}

disk_usage(){
	echo -e "\n=============== DISK USAGE ============================"
	df -h | awk 'NR==1'
	df -h | sort -hr -k3 | head -5
}

mem_usage(){
	echo -e "\n=============== MEMORY USAGE =========================="
	free -h | awk 'NR==2{print "Total : "$2,"\tUsed : "$3,"\tAvailable : "$4}'
}

cpu_consuming_processes(){
	echo -e "\n=============== CPU-CONSUMING PROCESSES ==============="
	#echo -e "PID\tUSER\t%CPU\tCOMMAND"
	#top -bn 1 | awk 'NR>=8' | sort -hr -k9 | awk 'NR<=5 {print $1,"\t"$2,"\t"$9,"\t"$12}'
	ps -eo pid,user,comm,%cpu,%mem --sort=-%cpu | head -n 6
}

main(){
	sys_info
	sys_uptime
	disk_usage
	mem_usage
	cpu_consuming_processes
}
main
