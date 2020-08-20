#!/bin/bash

hostName=$(hostname)
hostAddress=($(hostname -I))
SUB='Down'

#Define the IP addresses of the devices you wish to monitor
pingableAddresses=('8.8.8.8' '192.168.1.1' '192.168.1.2' '192.168.1.3')
#Define the name of the devices you wish to monitor
pingableHosts=('Internet' 'PC1' 'PC2' 'PC3')

addressLength=${#pingableAddresses[@]}

while true
    do
        clear
        echo "Host: $hostName"
        echo "LAN: ${hostAddress[0]}"
        echo "WiFi: ${hostAddress[1]}"
        echo "---------------------"

        for ((indexCounter=0; indexCounter<addressLength; indexCounter++)) 
            do
                echo -e "\e[39m${pingableHosts[indexCounter]}: \e[0m"
                pingAddress=$(ping ${pingableAddresses[indexCounter]} -qc1 2>&1 | awk -F'/' 'END{ print (/^rtt/? "Up "$5" ms":"Down") }')
                if [[ "$pingAddress" == "$SUB" ]]; 
                then
                    echo -e "\e[31m$pingAddress \e[0m"
                else
                    echo -e "\e[32m$pingAddress \e[0m"
                fi
        done

        sleep 5
        echo "\n"
done
