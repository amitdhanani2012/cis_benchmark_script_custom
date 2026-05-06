#!/bin/bash

echo -e "\e[32mdot file permission started\e[0m"

home1_path=$(awk -F':' '{ if ($3>999 && $7 !~ /nologin/) print $6}' /etc/passwd)

for home_path in `echo $home1_path`
do

find $home_path -type f -iname ".*" \( -perm 777 -o -perm 644 -o -perm 666 -o -perm 660  \) -exec chmod 640 {} \;
#echo "completed dot file perm change"
done
echo -e "done with dot file permission \e[32m[pass]\e[0m"
