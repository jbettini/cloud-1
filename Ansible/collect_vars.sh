#!/bin/bash

ansible_dir="/root/DataSource/Ansible"

edit_inventory() {
    number_vps=$1
    ansible_inventory="$ansible_dir/inventaire.yml"
    echo -e "all:\n  hosts:" > "$ansible_inventory"
    for ((i=0; i<number_vps; i++)); do
        echo -e "    vps$i:" >> "$ansible_inventory"
    done
}

while true; do
    read -p "How many VPS do you want to use? " number_vps
    if [[ "$number_vps" =~ ^[1-5]$ ]]; then
        break
    else
        echo "Please enter a valid number between 1 and 5."
    fi
done

read -p "Which address is agreed to connect to phpmyadmin? " agree_ip

edit_inventory "$number_vps"

ansible_hostvars="$ansible_dir/host_vars"

for ((i=0; i<number_vps; i++)); do
    var_file="$ansible_hostvars/vps$i.yml"
    read -p "Enter your vps ip : " vps_ip
    read -p "Enter your domain name : " domain_name
    echo -e "---\nansible_user: root" > $var_file
    echo -e "host_ip: $agree_ip" >> $var_file
    echo -e "ansible_host: $vps_ip" >> $var_file
    echo -e "domain: $domain_name" >> $var_file
done