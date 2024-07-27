
docker-compose run --rm cloud1

ssh root@51.158.107.187


start Your VPS and ping it with :

ansible -i inventaire.ini -m ping vps --user root 

--------------------------------------------------------------

Un role par dependance,
Un role pour cree un user-ansible



Instalation des dependance :

Sudo 
Curl
Docker



wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm




Peut etre devoir specifier le chemin de python a ansible

installer python au cas avec le module raw et ensuite installer :
Sudo 
Curl
Docker

avec le module apt