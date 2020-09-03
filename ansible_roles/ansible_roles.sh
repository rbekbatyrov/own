#!/bin/bash
dir_name=$1
path1=`pwd`
var1=`date +"%d%b%Y"`
mkdir -p ./inventories/
mkdir -p ./playbooks/roles/$dir_name/{default,files,handlers,meta,tasks,templates,vars}

cp /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg_back_$var1
cat > /etc/ansible/ansible.cfg <<EOF
[defaults]
inverntory            = $path1/inventories/
remote_user           = vagrant
host_key_checking     = False
forks                 = 5
transport             = smart
retry_files_enabled   = False
remote_port           = 2222

[diff]
always                = true
context               = 3
EOF


cat > ./inventories/test_inventory <<EOF
[hosts]
127.0.0.1

[hosts:vars]
ansible_ssh_private_key_file=/home/ruslan/Desktop/temp/vargant/.vagrant/machines/vm/virtualbox/private_key
EOF

cat > ./playbooks/nginx.yml <<EOF
---
- hosts: hosts
  become: yes
  roles:
    - nginx
EOF


cat > ./playbooks/roles/$dir_name/tasks/main.yml <<EOF
---
- name: Install epel Please
  yum: name=epel-release state=installed

- name: Install nginx Please
  yum: name=nginx state=installed

- name: Start nginx Please
  service: name=nginx state=started
EOF
