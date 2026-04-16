#!/bin/bash
#gname=$(cut -d: -f1 /etc/group | sort | uniq -d)
id1=$(cut -d: -f3 /etc/passwd | sort | uniq -d)

if [ -n "$id1" ]; then
	for i in `echo $id1`
	do
		echo "Duplicate uid detected, uid is $i"
	done
fi

