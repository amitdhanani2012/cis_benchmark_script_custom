#!/bin/bash

if  grep -q TMOUT /etc/profile || grep -q TMOUT /etc/profile.d/* ;then
echo -e "TMOUT already set \e[32m[pass]\e[0m"
else
printf '%s\n' "# Set TMOUT to 900 seconds" "typeset -xr TMOUT=900" >/etc/profile.d/50-tmout.sh
echo -e "TMOUT is set now \e[32m[pass]\e[0m"
fi
