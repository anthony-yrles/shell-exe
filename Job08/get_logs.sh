Date=$(date +%d-%m-%Y-%H:%M)
grep "session opened for user anthony" /var/log/auth.log | wc -l > number_connection-$Date

if [ ! -f Backup/number_connection-Date.tar ]
then
	tar -cvf Backup/number_connection-Date.tar number_connection-$Date
else
	tar -uvf Backup/number_connection-Date.tar number_connection-$Date
fi
rm number_connection-$Date
