#!/bin/bash

(grep -q "^KexAlgorithms" /etc/ssh/sshd_config && sed -i 's/^KexAlgorithms.*/KexAlgorithms -diffie-hellman-group1-sha1,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1/' /etc/ssh/sshd_config) || echo "KexAlgorithms -diffie-hellman-group1-sha1,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1" >>/etc/ssh/sshd_config
systemctl reset-failed sshd
systemctl restart sshd
if sshd -T |grep -i kexalgorithms |grep -e "diffie-hellman-group1-sha1" -e "diffie-hellman-group14-sha1" -e "diffie-hellman-group-exchange-sha1";then

echo -e "kexAlgorithms security is not implemented \033[31m[fail]\033[0m"
else

echo -e "kexAlgorithms security is implemented \e[32m[pass]\e[0m"
fi
