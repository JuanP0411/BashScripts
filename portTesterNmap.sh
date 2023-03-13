#!/bin/bash
#simple port tester using nmap
if [[  -z $1 ]]; then
echo "Usage $0 <host ip address>"
exit 1
fi

nmap $1
