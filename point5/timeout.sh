#!/bin/bash

if  grep -q TMOUT /etc/profile || grep -q TMOUT /etc/profile.d/* ;then
echo "TMOUT already set"
else
printf '%s\n' "# Set TMOUT to 900 seconds" "typeset -xr TMOUT=900" >/etc/profile.d/50-tmout.sh
fi
