#!/bin/bash
#!/bin/bash

salida0=$(ssh server@192.168.1.60 "curl -I http://raspberrypidpm2.ddns.net/SitioWebFinal |head -1| cut -d\" \" -f2 | tail -1")
salida1=$(ssh pi@192.168.1.95 "curl -I http://raspberrypidpm2.ddns.net/SitioWebFinal |head -1| cut -d\" \" -f2 | tail -1")
salida2=$(ssh pi@192.168.1.75 "curl -I http://raspberrypidpm2.ddns.net/SitioWebFinal |head -1| cut -d\" \" -f2 | tail -1")
salida3=$(ssh pi@192.168.1.55 "curl -I http://raspberrypidpm2.ddns.net/SitioWebFinal |head -1| cut -d\" \" -f2 | tail -1")

ok="200"
echo $salida

if [[ ( "$salida0" = "$ok" ) || ( "$salida1" = "$ok" ) ||  ( "$salida2" = "$ok" ) || ( "$salida3" = "$ok" ) ]]; then
	        echo "The server is responding"
	        exit 0
	else
		echo "The app its no responding"
		exit 1
	fi



