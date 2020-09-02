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
