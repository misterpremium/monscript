#!/bin/bash

case $1 in
 	1)freeCPU=$(ssh misterpremium@192.168.1.143 "top -b -d1 -n1|sed \"s/  / /g\" | grep -i \"Cpu(s)\" | cut -d \" \" -f8| cut -d \".\" -f1");;
	2)freeCPU=$(ssh server@192.168.1.60 "top -b -d1 -n1|sed \"s/  / /g\" | grep -i \"Cpu(s)\" | cut -d \" \" -f8| cut -d \".\" -f1");;
	3)freeCPU=$(ssh pi@192.168.1.55 "top -b -d1 -n1|sed \"s/  / /g\" | grep -i \"Cpu(s)\" | cut -d \" \" -f8| cut -d \".\" -f1");;
	4)freeCPU=$(ssh pi@192.168.1.75 "top -b -d1 -n1|sed \"s/  / /g\" | grep -i \"Cpu(s)\" | cut -d \" \" -f8| cut -d \".\" -f1");;
	5)freeCPU=$(ssh pi@192.168.1.95 "top -b -d1 -n1|sed \"s/  / /g\" | grep -i \"Cpu(s)\" | cut -d \" \" -f8| cut -d \".\" -f1");;
esac

usedCPU=$(( 100 - $freeCPU ))
echo $freeCPU
echo $usedCPU

if [ $usedCPU -le 40 ]; then 
	echo The CPU is $usedCPU load

	exit 0
elif [ [ $usedCPU -gt 40 ] && [ $usedCPU -le 80 ] ]; then
	echo The CPU is over $usedCPU of load
	exit 1
elif [ [ $usedCPU -gt 80 ] && [ $usedCPU -le 100 ] ]; then
	echo  The CPU is over $usedCPU of load
	exit 2
else 
	echo Unkown
	exit 3
fi

