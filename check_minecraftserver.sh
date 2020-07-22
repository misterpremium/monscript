
#!/bin/bash

user="root"
salida=$(ssh server@192.168.1.60  "ps wwwaxu| grep server.jar | head -1 | cut -d' ' -f1 ")
if [ "$salida" = "$user" ]; then 


 echo $? "Ok. The server is up and running"
 exit 0
else
	echo " The server its not running"
	exit 2
fi

