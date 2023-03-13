#!/bin/bash
#simple port scanner using /dev/tcp
if [ -z "$1"]; then
echo "Usage porTester <host ipadress>"
exit 1
fi

echo "Ingrese el puerto con el cual se va a empezar el scan "
read StartPort
echo "Ingrese el puerto con el cual se termina el scan"
read EndPort
host=$1
ping $host -c 1 &> /dev/null
if [[ $? == 0  ]];
then
	echo "$host is alive"

	for port in $(seq $StartPort $EndPort);
	do
		2> /dev/null echo >/dev/tcp/$host/$port
		if [[ $? == 0 ]];
		then 
		echo "$port is open"
		else
		echo "$port is closed"
		fi
	done
else
	echo "$host no esta vivo pana"
fi

