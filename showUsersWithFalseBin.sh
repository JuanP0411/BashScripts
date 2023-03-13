#! /bin/bash

cat /etc/passwd | grep /bin/false | awk '{print$1}'
