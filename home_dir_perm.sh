#!/bin/bash

home1_path=$(awk -F':' '{ if ($3>999 && $7 !~ /nologin/) print $1"-"$5"-"$6}' /etc/passwd)

echo $home1_path


for home_path in `echo $home1_path`
do
user=$(echo $home_path |cut -f1 -d'-')
group=$(echo $home_path|cut -f2 -d'-')
path1=$(echo $home_path|cut -f3 -d'-')
ls -ld $path1 |grep -e "drwxrwxrwx"  -e "drwxr-xr-x" -e "drwxrwx---" && chmod 750 $home_path 
chown $user.$group $path1
done
