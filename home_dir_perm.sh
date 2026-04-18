#!/bin/bash

home1_path=$(awk -F':' '{ if ($3>999 && $7 !~ /nologin/) print $1"-"$5"-"$6}' /etc/passwd)

echo $home1_path


for home_path in `echo $home1_path`
do
user=$(echo $home_path |cut -f1 -d'-')
group=$(echo $home_path|cut -f2 -d'-')
path1=$(echo $home_path|cut -f3 -d'-')
echo $user
echo $group
echo $path1
ls -ld $path1 |grep -e "drwxrwxrwx"  -e "drwxr-xr-x" -e "drwxrwx---" && chmod 750 $path1 
if [ -n "$user" -a -n "$group" ];then
chown $user.$group $path1
fi
done
