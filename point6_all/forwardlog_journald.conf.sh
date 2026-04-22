#!/usr/bin/env bash
#set -x
{
ls -ld /etc/systemd/journald.conf.d/ >/dev/null || mkdir /etc/systemd/journald.conf.d/
if grep -Pzq '[Journal]' /etc/systemd/journald.conf.d/60-journald.conf && ! grep -Pzq "ForwardToSyslog=yes" /etc/systemd/journald.conf.d/60-journald.conf ; then
sed -i "/[Journal]/a ForwardToSyslog=yes" /etc/systemd/journald.conf.d/60-journald.conf
systemctl reload-or-restart systemd-journald
echo "done with Forward To syslog"
elif ! grep -Pzq '[Journal].*\n.*ForwardToSyslog=yes' /etc/systemd/journald.conf.d/60-journald.conf;then
printf '%s\n' "[Journal]" "ForwardToSyslog=yes" >>/etc/systemd/journald.conf.d/60-journald.conf
systemctl reload-or-restart systemd-journald
echo "done with Forward To syslog"
else
echo "already setup done"
fi
}
