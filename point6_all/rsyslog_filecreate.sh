#!/bin/bash
#set -x
(grep "^\$FileCreateMode" /etc/rsyslog.conf && sed -i "s/\$FileCreateMode.*/\$FileCreateMode 0640/" /etc/rsyslog.conf)>/dev/null || echo "\$FileCreateMode 0640" >> /etc/rsyslog.conf
#echo "Starting validation"
systemctl restart rsyslog 
if [ $? -eq 0 ];then
echo "done with rsyslog file create mode 640"
fi
