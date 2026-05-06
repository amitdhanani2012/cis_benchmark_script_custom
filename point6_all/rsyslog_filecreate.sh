#!/bin/bash
echo -e "\e[32m rsyslog file create started\e[0m"
#set -x
(grep "^\$FileCreateMode" /etc/rsyslog.conf && sed -i "s/\$FileCreateMode.*/\$FileCreateMode 0640/" /etc/rsyslog.conf)>/dev/null || echo "\$FileCreateMode 0640" >> /etc/rsyslog.conf
#echo "Starting validation"
systemctl restart rsyslog 
if [ $? -eq 0 ];then
echo -e "done with rsyslog file create mode 640 \e[32m[pass]\e[0m"
fi
