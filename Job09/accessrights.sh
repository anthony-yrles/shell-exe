#!/usr/bin/bash

fileName="Shell_Userlist.csv"
saveName="SaveShell.txt"

echo "Début de l'exécution du script à $(date)" >> ScriptLog.txt

#if [ "$(md5sum $fileName)" != "$(md5sum $saveName)" ]
#then

idList=$(awk '! /Id/ {print $1}' FS=',' "$fileName")
prenomList=$(awk '! /Prenom/ {print $2}' FS=',' "$fileName")
nomList=$(awk '! /Nom/ {print $3}' FS=',' "$fileName")
mdpList=$(awk '! /Mdp/ {print $4}' FS=',' "$fileName")
roleList=$(awk '! /Rôle/ {print $5}' FS=',' "$fileName")

for i in {1..12}
do
	id=$(echo "$idList" | cut -d $'\n' -f $i)
	prenom=$(echo "$prenomList" | cut -d $'\n' -f $i)
	nom=$(echo "$nomList" | cut -d $'\n' -f $i)
	mdp=$(echo "$mdpList" | cut -d $'\n' -f $i)
	role=$(echo "$roleList" | cut -d $'\n' -f $i)
	user=$(echo $prenom $nom)
		
	if [ "$role" != "User" ]
	then
		groups="Admin"
	else
		groups="User"
	fi

	#sudo userdel "$user"		
	sudo useradd "$user" --badnames --uid $id --home /mnt/c/Users/mabbo/Bureau/shell-exe/Job09/home --groups $groups
	echo "$user:$mdp" | sudo chpasswd
		
	if [ "$groups" == "Admin" ]
	then
		sudo usermod -aG sudo "$user"
	fi
done
#fi
#md5sum $fileName > $saveName

echo "Fin de l'exécution du script à $(date)" >> ScriptLog.txt
