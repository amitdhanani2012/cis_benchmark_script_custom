#!/bin/bash

(grep -q "^PermitRootLogin" /etc/ssh/sshd_config && sed -i 's/\(^PermitRootLogin\)\(.*\)/\1 no/' /etc/ssh/sshd_config) || echo "PermitRootLogin no" >>/etc/ssh/sshd_config
systemctl restart sshd

if sshd -T |grep -i PermitRootLogin |grep -i no;then
echo "Deny Root Login in ssh security implemented"
else
echo "Deny Root Login not done"
fi
