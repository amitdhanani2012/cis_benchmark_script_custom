#!/bin/bash
#set -x
u1=$(grep "^UMASK" /etc/login.defs)
u2=$(echo $u1 |cut -f2 -d' ' )
if [ "$u2" != "027" ];then
sed -i 's/UMASK.*/UMASK 027/' /etc/login.defs
fi
