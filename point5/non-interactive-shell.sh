#!/bin/bash
#set -x

#user=$(awk -F':' '{ if ($3<=999 && $7 !~ /nologin/ && $4 != 0 ) print $0 }' /etc/passwd)
user1=$(awk -F':' '{ if ($3<=999 && $7 !~ /nologin/ && $3 != 0 && $7 == "/bin/bash" ) print $1 }' /etc/passwd)
if [ -n "$user1" ];then
grep -q $user1 /etc/passwd && sed -i 's/\/bin\/bash/\/usr\/bin\/nologin/' /etc/passwd
fi
