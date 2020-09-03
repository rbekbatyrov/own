//script "ansible_roles.sh" make tree of directories for ansible.
//just copy the bash-file to the directory you want and make "bash ansible_roles.sh" after that you can see below
.
├── ansible_roles.sh
├── inventories
│   ├── prod
│   ├── stagging
│   └── test
├── playbooks
└── roles
    └── [testrole]
        ├── default
        │   └── main.yml
        ├── files
        ├── handlers
        │   └── main.yml
        ├── meta
        │   └── main.yml
        ├── tasks
        │   └── main.yml
        ├── templates
        └── vars
            └── main.yml

>>> ansible with roles and vars
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
