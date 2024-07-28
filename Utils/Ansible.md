Useful

ssh root@51.158.107.187

Task :
****************************************************************

****************************************************************



********
• In case of reboot all the data of the site are persisted (images, user accounts, articles,
...).
********
Cree un dossier pour les volumes wordpress et pour mariadb


********
• The script must be able to function in an automated way with for only assumption
an ubuntu 20.04 LTS like OS of the target instance running an SSH daemon and
with Python installed.
• Your applications will run in separate containers that can communicate with each
other (1 process = 1 container)
• You must have a docker-compose.yml.
********

Automatiquement fait avec docker-compose


installer toutes les dependance :
Python
Docker

Cree les dossier de volume :

/data/wp /data/db

Copier/cree le tree docker, puis le lancer



Peut etre devoir specifier le chemin de python a ansible



Pour ssl d'abord, copier http.conf dans le fichier default.conf de nginx et lancer :
docker compose up cerbot --build

Une fois les certificat generer copier https.conf dans le fichier default.conf de nginx et lancer :
docker compose up -d --build