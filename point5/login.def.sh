#!/bin/bash
echo -e "\e[32m login.def started\e[0m"
#set -x
u1=$(grep "^UMASK" /etc/login.defs)
u2=$(echo $u1 |cut -f2 -d' ' )
if [ "$u2" != "027" -a -n "$u2" ];then
sed -i 's/UMASK.*/UMASK 027/' /etc/login.defs
echo -e "done for login.defs \e[32m[pass]\e[0m"
elif [ -z "$u2" ];then
echo "UMASK 027" >>/etc/login.defs
echo -e "done for login.defs \e[32m[pass]\e[0m"
else
echo -e "done for login.defs \e[32m[pass]\e[0m"
fi
