#!/bin/bash
#set -x
u1=$(grep "^UMASK" /etc/login.defs)
u2=$(echo $u1 |cut -f2 -d' ' )
if [ "$u2" != "027" -a -n "$u2" ];then
sed -i 's/UMASK.*/UMASK 027/' /etc/login.defs
echo "done for login.defs"
elif [ -z "$u2" ];then
echo "UMASK 027" >>/etc/login.defs
echo "done for login.defs"
else
echo "done for login.defs"
fi
