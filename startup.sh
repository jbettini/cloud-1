#!/bin/bash

lockfile="/tmp/check.lock"
varsfile="/root/DataSource/Ansible/roles/createDockerCompose/vars/main.yml"
playfile="/root/DataSource/Ansible/playbook.yml"

if [ -f "$lockfile" ]; then
    fish
else
    touch "$lockfile"
    if [ -d ".ssh/existingSsl" ]; then
        cp -rf .ssh/existingSsl/* /root/DataSource/Ansible/roles/useExistingSsl/files/.
    fi

    pma_user=$(openssl rand -base64 7 | tr -d '=')
    pma_pass=$(openssl rand -base64 7 | tr -d '=')
    root_pass=$(openssl rand -base64 7 | tr -d '=')

    echo -e "\033[1;32musername for phpmyadmin : $pma_user\033[0m"
    echo -e "\033[1;32mpassword for phpmyadmin : $pma_pass\n\033[0m"
    echo -e "username for phpmyadmin : $pma_user" >> "$lockfile"
    echo -e "password for phpmyadmin : $pma_pass" >> "$lockfile"

    echo -e "---\ndb_name: LaBase\ndb_user: $pma_user\ndb_pass: $pma_pass\nroot_pass: $root_pass" > $varsfile
fi

