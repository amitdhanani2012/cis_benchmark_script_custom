#!/bin/bash

(grep -q "^LoginGraceTime" /etc/ssh/sshd_config && sed -i 's/\(^LoginGraceTime\)\(.*\)/\1 60/' /etc/ssh/sshd_config) || echo "LoginGraceTime 60">>/etc/ssh/sshd_config
systemctl restart sshd
if sshd -T |grep -i "logingracetime"|grep 60;then 
echo "login gracetime done"
fi
