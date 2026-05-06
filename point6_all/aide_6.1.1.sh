#!/bin/bash
#set -x
echo -e "\e[32maide init started\e[0m"
if !(rpm -q aide) && dnf install aide -y;then
aide --init
mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
if [ $? -eq 0 ];then
echo -e "aid done with new install \e[32m[pass]\e[0m "
else
echo -e "aid new install not done fail \033[31m[fail]\033[0m"
fi
else
aide --init
mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
if [ $? -eq 0 ];then
echo -e "aide done \e[32m[pass]\e[0m"
else
echo -e "aid not done fail \033[31m[fail]\033[0m"
fi
fi
