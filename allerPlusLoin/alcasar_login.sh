#!/bin/bash

email="$1"
password="$2"


base_url="https://alcasar.laplateforme.io/intercept.php"
res="logoff"
uamip="10.10.0.1"
uamport="3990"
challenge="222cac5be834f5752c4488c3bd418bff"
called="68-05-CA-3A-2E-49"
mac="40-1A-58-03-3D-B2"
ip="10.10.14.65"
nasid="alcasar.laplateforme.io"
sessionid="169599759100000146"
ssl="https%3a%2f%2f1.0.0.1%3a3991%2f"
userurl="http%3a%2f%2fwww.msftconnecttest.com%2fredirect"
md="9D1F11333BF42B7B4379551FCB4F774C"


alcasar_url="${base_url}?res=${res}&uamip=${uamip}&uamport=${uamport}&challenge=${challenge}&called=${called}&mac=${mac}&ip=${ip}&nasid=${nasid}&sessionid=${sessionid}&ssl=${ssl}&userurl=${userurl}&md=${md}&username=${email}&password=${password}"

response=$(curl -s "$alcasar_url")

if [[ $response == *"Connexion réussie"* ]]; then
    echo "Connexion réussie !"
else
    echo "Échec de la connexion."
fi

#Ca marche pas



