#!/bin/bash
#gname=$(cut -d: -f1 /etc/group | sort | uniq -d)
id1=$(cut -d: -f3 /etc/group | sort | uniq -d)

if [ -n "$id1" ]; then
	for i in `echo $id1`
	do
		echo "Duplicate gid detected, id is $i"
	done
fi

