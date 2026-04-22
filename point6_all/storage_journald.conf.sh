#!/usr/bin/env bash
#set -x
{
ls -ld /etc/systemd/journald.conf.d/ >/dev/null || mkdir /etc/systemd/journald.conf.d/
if grep -Pzq '[Journal]' /etc/systemd/journald.conf.d/60-journald.conf && ! grep -Pzq "Storage=persistent" /etc/systemd/journald.conf.d/60-journald.conf ; then
sed -i "/[Journal]/a Storage=persistent" /etc/systemd/journald.conf.d/60-journald.conf
systemctl reload-or-restart systemd-journald
echo "done with storage persistent"
elif ! grep -Pzq '[Journal].*\n.*Storage=persistent' /etc/systemd/journald.conf.d/60-journald.conf;then
printf '%s\n' "[Journal]" "Storage=persistent" >>/etc/systemd/journald.conf.d/60-journald.conf
systemctl reload-or-restart systemd-journald
echo "done with storage persistent"
else
echo "already setup done"
fi
}
