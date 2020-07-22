#!/bin/bash



case $1 in
        1)totalMem=$(ssh misterpremium@192.168.1.143 "free -h | head -2 | tail -1 | sed \"s/          / /g\" | sed \"s/       / /g\"| sed \"s/   / /g\" | sed \"s/  / /g\" | cut -d \" \" -f2| sed  -e 's/.$//' | sed  -e 's/.$//'")
	avaMem=$(ssh misterpremium@192.168.1.143 "free -h | head -2 | tail -1 | sed \"s/          / /g\" | sed \"s/       / /g\"| sed \"s/   / /g\" | sed \"s/  / /g\" | cut -d \" \" -f7| sed  -e 's/.$//' | sed  -e 's/.$//'");;

        2)totalMem=$(ssh server@192.168.1.60 "free -h | head -2 | tail -1 | sed \"s/          / /g\" | sed \"s/       / /g\"| sed \"s/   / /g\" | sed \"s/  / /g\" | cut -d \" \" -f2| sed  -e 's/.$//'| sed 's/,/./g'")
 	avaMem=$(ssh server@192.168.1.60 "free -h | head -2 | tail -1 | sed \"s/          / /g\" | sed \"s/       / /g\"| sed \"s/   / /g\" | sed \"s/  / /g\" | cut -d \" \" -f7| sed  -e 's/.$//'i| sed 's/,/./g'")
;;
        3)totalMem=$(ssh pi@192.168.1.55 "free -h | head -2 | tail -1 | sed \"s/          / /g\" | sed \"s/       / /g\"| sed \"s/   / /g\" | sed \"s/  / /g\" | cut -d \" \" -f2| sed  -e 's/.$//'")
	avaMem=$(ssh pi@192.168.1.55 "free -h | head -2 | tail -1 | sed \"s/          / /g\" | sed \"s/       / /g\"| sed \"s/   / /g\" | sed \"s/  / /g\" | cut -d \" \" -f7| sed  -e 's/.$//'")
;;
        4)totalMem=$(ssh pi@192.168.1.75 "free -h | head -2 | tail -1 | sed \"s/          / /g\" | sed \"s/       / /g\"| sed \"s/   / /g\" | sed \"s/  / /g\" | cut -d \" \" -f2| sed  -e 's/.$//'")
	avaMem=$(ssh pi@192.168.1.75 "free -h | head -2 | tail -1 | sed \"s/          / /g\" | sed \"s/       / /g\"| sed \"s/   / /g\" | sed \"s/  / /g\" | cut -d \" \" -f7| sed  -e 's/.$//'")
;;
        5)totalMem=$(ssh pi@192.168.1.95 "free -h | head -2 | tail -1 | sed \"s/          / /g\" | sed \"s/       / /g\"| sed \"s/   / /g\" | sed \"s/  / /g\" | cut -d \" \" -f2| sed  -e 's/.$//' | sed  -e 's/.$//'")
	avaMem=$(ssh pi@192.168.1.95 "free -h | head -2 | tail -1 | sed \"s/          / /g\" | sed \"s/       / /g\"| sed \"s/   / /g\" | sed \"s/  / /g\" | cut -d \" \" -f7| sed  -e 's/.$//' | sed  -e 's/.$//'");;

esac

echo $totalMem
echo $avaMem
usedMem=$( echo $totalMem - $avaMem | bc)


echo $usedMem

if (( $(echo "$avaMem > 1" | bc -l) )) ; then
        echo The amount of memori use is $usedMem And has $avaMem free

        exit 0
else
        echo  The server will be out of memmory
	echo it has $avaMem free mem
        exit 2
fi

