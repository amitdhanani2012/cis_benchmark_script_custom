#!/bin/bash

(grep -q "^MaxAuthTries" /etc/ssh/sshd_config && sed -i 's/\(^MaxAuthTries\)\(.*\)/\1 4/' /etc/ssh/sshd_config) || echo "MaxAuthTries 4" >>/etc/ssh/sshd_config
systemctl restart sshd
if  sshd -T |grep -i maxauthtries |grep 4;then 
echo "MaxAuthTries security implemented"
fi
