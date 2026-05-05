#!/bin/bash
#set -x
if !(rpm -q aide) && dnf install aide -y;then
aide --init
mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
echo "aid done with new install"
else
aide --init
mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
echo "aide done"
fi
