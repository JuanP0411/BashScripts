
#!/bin/bash

#Get the first three octests of the network ip


ifconfig | grep "broadcast" | cut -d " " -f 10 | cut -d "." -f 1,2,3 | uniq >octets.txt

#Set variable to have the value of  octets.txt

OCTETS=$(cat octets.txt)

#Create a new .txt file with the network ip address

echo "" > $OCTETS.txt

#Loop through all the possible ip combinations in the network to see which responds
for ip in $(seq 1 254)
do
	ping -c 1 $OCTETS.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> $OCTETS.txt &
done


exit 
