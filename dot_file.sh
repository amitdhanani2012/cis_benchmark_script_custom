#!/bin/bash

home1_path=$(awk -F':' '{ if ($3>999 && $7 !~ /nologin/) print $6}' /etc/passwd)

for home_path in `echo $home1_path`
do

find $home_path -type f -iname ".*" \( -perm 777 -o -perm 644 -o -perm 666 -o -perm 660  \) -exec chmod 640 {} \;
done
