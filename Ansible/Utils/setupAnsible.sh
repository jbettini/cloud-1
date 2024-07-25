#!/bin/bash

#Creation de user-ansible
ansible -i /root/DataSource/Ansible/Utils/inventaire.ini -m user -a 'name=user-ansible password=inceptionpwd' --user root all
#Add user-ansible dans le groupe sudoers
ansible -i /root/DataSource/Ansible/Utils/inventaire.ini -m user -a 'name=user-ansible groups=sudo append=yes ' --user root all