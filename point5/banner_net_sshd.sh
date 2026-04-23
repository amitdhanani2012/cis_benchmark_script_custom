#!/bin/bash

if ! grep -q "^Banner \/etc\/issue\.net" /etc/ssh/sshd_config && ! grep -q "^Banner" /etc/ssh/sshd_config;then
echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config
systemctl restart sshd
echo "Banner done"
else
grep -q "^Banner" /etc/ssh/sshd_config && sed -i 's/^Banner.*/Banner \/etc\/issue.net/' /etc/ssh/sshd_config
systemctl restart sshd
echo "Banner done"
fi
