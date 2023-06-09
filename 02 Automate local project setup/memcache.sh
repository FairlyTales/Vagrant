#!/bin/bash
sudo apt update
sudo apt install memcached -y
sudo apt install firewalld -y

sudo systemctl start memcached
sudo systemctl enable memcached
sudo systemctl status memcached

firewall-cmd --add-port=11211/tcp --permanent
firewall-cmd --reload
sed -i 's/OPTIONS="-l 127.0.0.1"/OPTIONS=""/' /etc/sysconfig/memcached
sudo systemctl restart memcached

sudo memcached -p 11211 -U 11111 -u memcached -d