#!/bin/bash
gname=$(cut -d: -f1 /etc/group | sort | uniq -d)
#id1=$(cut -d: -f3 /etc/group1 | sort | uniq -d)

if [ -n "$gname" ]; then
	for i in `echo $gname`
	do
		echo "Duplicate group detected, Group name is $i"
	done
fi

