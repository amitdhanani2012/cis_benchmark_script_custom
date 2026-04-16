#!/bin/bash

home1_path=$(awk -F':' '{ if ($3>999 && $7 !~ /nologin/) print $6}' /etc/passwd)

for home_path in `echo $home1_path`
do

ls -ld $home_path |grep -e "drwxrwxrwx"  -e "drwxr-xr-x" && chmod 750 $home_path
done
