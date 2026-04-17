#!/bin/bash

sed -i 's/^create.*/create 640/g' /etc/logrotate.conf
sapath=$(rpm -ql sysstat |grep -e "sa1$" -e "sa2$")

if [ -n "$sapath" ];then
for i in `echo $sapath`
do
sed -i 's/umask.*/umask 027/g' $i
done
fi

find /var/log/ -type f \( -perm 666 -o -perm 664 -o -perm 644 -o -perm 660 \) -exec chmod 640 {} \;
find /var/log/ -type d \( -perm 777 -o -perm 755 -o -perm 770 -o -perm 775 \) -exec chmod 750 {} \;

