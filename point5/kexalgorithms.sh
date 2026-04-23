#!/bin/bash

(grep -q "^KexAlgorithms" /etc/ssh/sshd_config && sed -i 's/\(^KexAlgorithms\)\(.*\)/\1 -diffie-hellman-group1-sha1,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1/' /etc/ssh/sshd_config) || echo "KexAlgorithms -diffie-hellman-group1-sha1,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1" >>/etc/ssh/sshd_config
systemctl restart sshd
if sshd -T |grep -i kexalgorithms |grep -e "diffie-hellman-group1-sha1" -e "diffie-hellman-group14-sha1" -e "diffie-hellman-group-exchange-sha1";then

echo "kexAlgorithms security is not implemented"
else

echo "kexAlgorithms security is implemented"
fi
