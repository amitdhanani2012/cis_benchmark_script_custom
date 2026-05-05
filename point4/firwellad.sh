#!/bin/bash

firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --zone=public --permanent --add-service=ssh
firewall-cmd --zone=public --permanent --add-service=https
firewall-cmd --zone=public --permanent --add-port=10020-10022/tcp
firewall-cmd --zone=public --permanent --list-ports
firewall-cmd --reload
systemctl enable firewalld
systemctl restart firewalld
if [ $? -eq 0 ];then
echo -e "Firewalld setup done \e[32m[pass]\e[0m"
else
echo -e "Firewall setup fail \033[31m[fail]\033[0m"
fi
