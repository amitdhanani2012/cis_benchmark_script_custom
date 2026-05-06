#!/usr/bin/env bash
echo -e "\e[32mstorage journald conf started\e[0m"
#set -x
{
ls -ld /etc/systemd/journald.conf.d/ >/dev/null || mkdir /etc/systemd/journald.conf.d/
if grep -Pzq '[Journal]' /etc/systemd/journald.conf.d/60-journald.conf && ! grep -Pzq "Storage=persistent" /etc/systemd/journald.conf.d/60-journald.conf ; then
sed -i "/[Journal]/a Storage=persistent" /etc/systemd/journald.conf.d/60-journald.conf
systemctl reload-or-restart systemd-journald
if [ $? -eq 0 ];then
echo -e "done with storage persistent \e[32m[pass]\e[0m"
fi
elif ! grep -Pzq '[Journal].*\n.*Storage=persistent' /etc/systemd/journald.conf.d/60-journald.conf;then
printf '%s\n' "[Journal]" "Storage=persistent" >>/etc/systemd/journald.conf.d/60-journald.conf
systemctl reload-or-restart systemd-journald
if [ $? -eq 0 ];then
echo -e "done with storage persistent \e[32m[pass]\e[0m"
fi
else
echo -e "already setup done \e[32m[pass]\e[0m"
fi
}
