#!/bin/bash

if ! grep -q "^Banner \/etc\/issue\.net" /etc/ssh/sshd_config && ! grep -q "^Banner" /etc/ssh/sshd_config;then
echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config
systemctl reset-failed sshd
systemctl restart sshd
if [ $? -eq 0 ];then
echo -e "Banner done \e[32m[pass]\e[0m"
fi
else
grep -q "^Banner" /etc/ssh/sshd_config && sed -i 's/^Banner.*/Banner \/etc\/issue.net/' /etc/ssh/sshd_config
systemctl reset-failed sshd
systemctl restart sshd
if [ $? -eq 0 ];then
echo -e "Banner done \e[32m[pass]\e[0m"
fi
fi
