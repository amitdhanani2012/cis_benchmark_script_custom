#!/bin/bash

(grep -q "^PermitRootLogin" /etc/ssh/sshd_config && sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config) || echo "PermitRootLogin no" >>/etc/ssh/sshd_config
systemctl restart sshd

if sshd -T |grep -i PermitRootLogin |grep -i no;then
echo -e "Deny Root Login in ssh security implemented \e[32m[pass]\e[0m"
else
echo -e "Deny Root Login not done \033[31m[fail]\033[0m"
fi
