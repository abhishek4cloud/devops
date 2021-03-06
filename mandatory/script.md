Script to run periodically and externally to check if the server is up and running serving the expected version number


#1 Create a shell script named script.sh

Add the following commands inside

	#!/bin/bash

	curl {SERVER_IP}:{PORT}:80/version.txt &> /dev/pts/0 or /dev/tty {depends on the distribution for displaying the version number on terminal}

	if [[ $? == 0 ]]

	then
    		cat "/dev/pts/0" or "dev/tty
    		exit 0

	else
    		echo "Service is offline!"
    		exit 1
	fi

#2 make the script executable

    	chmod +x script.sh

#3 Inorder to run the script periodically set a cron job

	type crontab -e
        and add the following commands(I've assumed the script to run every 5 minutes)
        
	SHELL=/bin/bash

	 */5 * * * * {script_location}/{script_name}.sh > /dev/pts/0 {or} /dev/tty       
        
#4 The cron job runs automatically	
