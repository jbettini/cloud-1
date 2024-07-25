
docker-compose run --rm cloud1

ssh root@51.158.107.187


start Your VPS and ping it with :

ansible -i inventaire.ini -m ping vps --user root 
ansible -m ping all


--------------------------------------------------------------

D'abord on cree un user pour limiter les action de ansible sur notre machine distante :

ansible -i inventaire.ini -m user -a 'name=user-ansible password=inceptionpwd' --user root --ask-pass all

mdp : inception pwd
ndc : user-ansible

--------------------------------------------------------------

Ajout du user-ansible au groupe sudo :

ansible -i inventaire.ini -m user -a 'name=user-ansible groups=sudo append=yes ' --user root --ask-pass all


Check si il a bien ete ahjouter au groupe sudoers :

ansible -i inventaire.ini -m user -a 'name=user-ansible groups=sudo append=yes ' --user user-ansible --ask-pass --become --ask-become-pass all

--------------------------------------------------------------



Instalation des dependance :

Sudo 
Curl
Docker
