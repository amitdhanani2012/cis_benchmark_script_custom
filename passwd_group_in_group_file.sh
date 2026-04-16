#!/bin/bash
for i in `awk -F':' '{ print $4 }' /etc/passwd`
do
#echo $i
grep $i  /etc/group >/dev/null 

if [ $? -eq 0 ];then
  echo "$i group id exist"
else
  echo "$i group does not exist" 
fi

done

