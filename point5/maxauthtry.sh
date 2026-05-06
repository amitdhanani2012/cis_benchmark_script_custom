#!/bin/bash
echo -e "\e[32mmax auth try started\e[0m"
(grep -q "^MaxAuthTries" /etc/ssh/sshd_config && sed -i 's/^MaxAuthTries.*/MaxAuthTries 4/' /etc/ssh/sshd_config) || echo "MaxAuthTries 4" >>/etc/ssh/sshd_config
systemctl reset-failed sshd
systemctl restart sshd
if  sshd -T |grep -i maxauthtries |grep 4;then 
echo -e "MaxAuthTries security implemented \e[32m[pass]\e[0m"
else
echo -e "MaxAuthTries security not implemented \033[31m[fail]\033[0m" 
fi
