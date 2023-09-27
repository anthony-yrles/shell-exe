#!/usr/bin/bash

Date=$(date +%d-%m-%Y-%H:%M)
grep "session opened for user anthony" /var/log/auth.log | wc -l > /mnt/c/Users/mabbo/Bureau/shell-exe/Job08/number_connection-$Date

if [ ! -f /mnt/c/Users/mabbo/Bureau/shell-exe/Job08/Backup/number_connection-Date.tar ]
then
	tar -cvf /mnt/c/Users/mabbo/Bureau/shell-exe/Job08/Backup/number_connection-Date.tar /mnt/c/Users/mabbo/Bureau/shell-exe/Job08/number_connection-$Date
else
	tar -uvf /mnt/c/Users/mabbo/Bureau/shell-exe/Job08/Backup/number_connection-Date.tar /mnt/c/Users/mabbo/Bureau/shell-exe/Job08/number_connection-$Date
fi
rm /mnt/c/Users/mabbo/Bureau/shell-exe/Job08/number_connection-$Date
