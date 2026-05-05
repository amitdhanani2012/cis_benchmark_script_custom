#!/bin/bash

(grep -q "^MaxStartups" /etc/ssh/sshd_config && sed -i 's/^MaxStartups.*/MaxStartups 10:30:60/' /etc/ssh/sshd_config) || echo "MaxStartups 10:30:60" >>/etc/ssh/sshd_config
systemctl reset-failed sshd
systemctl restart sshd
echo "MaxStartups 10:30:60 implemented \e[32m[pass]\e[0m"
