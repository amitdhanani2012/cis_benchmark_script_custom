#!/bin/bash
#set -x
(grep "^\$FileCreateMode" /etc/rsyslog.conf && sed -i "s/\$FileCreateMode.*/\$FileCreateMode 0640/" /etc/rsyslog.conf)>/dev/null || echo "\$FileCreateMode 0640" >> /etc/rsyslog.conf
echo "Starting validation"
rsyslogd -N1
echo "done with rsyslog file create mode 640"
