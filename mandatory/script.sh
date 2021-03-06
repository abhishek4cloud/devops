 #!/bin/bash

        curl {SERVER_IP}:{PORT}/version.txt &> /dev/tty

        if [[ $? == 0 ]]

        then
                cat "/dev/tty"
                exit 0

        else
                echo "Service is offline!"
                exit 1
        fi

