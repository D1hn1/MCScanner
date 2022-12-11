#!/bin/bash

trap ctrl_c INT

function ctrl_c() { 
	tput cnorm
	exit 
}

if cat ips &>/dev/null; then
	
	tput civis

	lenth=$(cat ips | xargs | tr ' ' '\n' | wc -l)
	dateS=$(date)
	num=1
	clear
	
	for x in $(cat ips); do
		echo "Results will be saved in results.txt"
		echo "Scan started at $dateS"
		echo
		echo "Scanning $x ($num/$lenth)"
		scanS=$(timeout 2 nmap --script minecraft-info.nse -Pn -n -p 25565 $x)
		
		if echo $scanS | grep 'Script execution failed' &>/dev/null; then
			continue
		else
			if echo $scanS | grep 'minecraft-info' &>/dev/null; then
				echo >> results.txt
				echo "--> $x" >> results.txt
				echo $scanS | tr '|' '\n' | grep 'minecraft-info' -A 11 | grep -Pv "N.*?ds" >> results.txt
				echo $scanS | tr '|' '\n' | grep 'minecraft-info' -A 11 | grep -Pv "N.*?ds"
				echo >> results.txt
				sleep 1
			fi
		fi
		
		num=$((num + 1))
		clear
	done 

else
	
	echo "No file 'ips' found"
	echo "Make a file named ips with all the ip´s in it."

fi

tput cnorm
