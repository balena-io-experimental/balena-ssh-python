#!/bin/bash

# Set the root password as root if not set as an ENV variable
export PASSWD=${PASSWD:=root}

# Set the root password
echo "root:$PASSWD" | chpasswd

#Spawn dropbear
dropbear -E -F &

# Starts application from here
python3 main.py
