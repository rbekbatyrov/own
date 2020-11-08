>>> ansible_roles.sh <<<
//script "ansible_roles.sh" make tree of directories and create files for ansible.
//Files are: /etc/ansible/ansible.cfg, ../inventories/test_inventory, ../playbooks/roles/$dir_name/tasks/main.yml
//just copy the bash-file to the directory you want and make "bash ansible_roles.sh [role_name]"
//for example: bash ansible_roles.sh nginx
//after that you can see below
.
├── ansible_roles.sh
├── inventories
│   └── test_inventory
└── playbooks
    ├── nginx.yml
    └── roles
        └── nginx
            ├── default
            ├── files
            ├── handlers
            ├── meta
            ├── tasks
            │   └── main.yml
            ├── templates
            └── vars

//you can make "$ ansible-playbook -i inventories/test_inventory playbooks/nginx.yml"
//that's all


>>> ansible with roles and vars <<<
$ vi /home/ruslan/Desktop/temp/ansible_roles/nginx.yml
>>> BOF <<<
---
- hosts: hosts
  become: yes
  roles:
    - nginx
  vars:
    - nginx_worker_processes: 4
    - nginx_user: www-data
>>> EOF <<<

$ vi /home/ruslan/Desktop/temp/ansible_roles/roles/nginx/template/nginx.conf
>>> BOF <<<
...
user {{ nginx_user }};
...
worker_processes {{ nginx_worker_processes }};
...
>>> EOF <<<

>>> Usefull commands <<<
$ ssh user@192.168.10.2
$ sudo usermod -aG wheel user
$ ssh-copy-id user@192.168.10.2
$ ansible-playbook -u user main.yml -K -i inventory                 //make all roles
$ ansible-playbook -u user -t nginx main.yml -K -i inventory     //make nginx role
$ ansible-playbook -u user -t filebeat main.yml -K -i inventory     //make filebeat role


