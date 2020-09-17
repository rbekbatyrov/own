#Here is some documentory to install mysql (primary-secondary) with keepalived failover deamon on centos/debian.

#Instalation mysql on Debain_10/Ubuntu (on primary and secondary both)

$ sudo apt-get install software-properties-common dirmngr
$ sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
$ sudo add-apt-repository 'deb [arch=amd64] http://mirror.mephi.ru/mariadb/repo/10.5/debian buster main'
$ sudo apt-get update
$ sudo apt-get install mariadb-server

#Instalation mysql on CentOS (on primary and secondary both)

$ sudo yum install 
