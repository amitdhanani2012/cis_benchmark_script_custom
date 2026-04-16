#!/bin/bash
declare -A gid
x=0
for i in `awk -F':' '{ print $4 }' /etc/passwd`
do
#echo $i
grep $i  /etc/group >/dev/null 

if [ $? -eq 0 ];then
  echo "$i group id exist"
else
  #echo "$i group does not exist" 
  mark="True" 
  gid[$x]=$i
  x=`expr $x + 1`

fi

done

if [ $mark == "True" ];then
for i in ${gid[@]}
do
echo "group $i does not exist"
done
fi
