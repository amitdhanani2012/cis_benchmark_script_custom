#!/bin/bash
gname=$(cut -d: -f1 /etc/passwd | sort | uniq -d)
#id1=$(cut -d: -f3 /etc/group1 | sort | uniq -d)

if [ -n "$gname" ]; then
	for i in `echo $gname`
	do
		echo "Duplicate user detected, user name is $i"
	done
fi

