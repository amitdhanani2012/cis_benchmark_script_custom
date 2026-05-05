#!/bin/bash

(grep -q "^LoginGraceTime" /etc/ssh/sshd_config && sed -i 's/^LoginGraceTime.*/LoginGraceTime 60/' /etc/ssh/sshd_config) || echo "LoginGraceTime 60">>/etc/ssh/sshd_config
systemctl reset-failed sshd
systemctl restart sshd
if sshd -T |grep -i "logingracetime"|grep 60;then 
echo -e "login gracetime done \e[32m[pass]\e[0m"
else
echo -e "login gracetime \033[31m[fail]\033[0m"
fi
