#!/bin/bash
#set -x
echo -e "\e[32msystemd-journal-upload started \e[0m"
flag1=$(systemctl is-active systemd-journal-upload.service)
if [ "$flag1" != "active" ];then
systemctl start systemd-journal-upload.service
else
echo -e "systemd-journal-upload is already active \e[32m[pass]\e[0m"
exit 0
fi
flag1=$(systemctl is-active systemd-journal-upload.service)
if [ "$flag1" != "active" ];then
echo $flag1
mkdir -p /var/log/journal/remote && chown systemd-journal-remote /var/log/journal/remote

systemctl enable systemd-journal-remote.socket
sudo mkdir -p /etc/systemd/system/systemd-journal-remote.service.d/
printf "[Service]\nExecStart=\nExecStart=/lib/systemd/systemd-journal-remote --listen-http=-3 --output=/var/log/journal/remote/" | sudo tee /etc/systemd/system/systemd-journal-remote.service.d/override.conf
systemctl daemon-reload

systemctl enable --now systemd-journal-remote.socket
systemctl enable --now systemd-journal-remote.service


cat >/etc/systemd/system/journal-upload.service.d/override.conf  <<EOF
[Unit]
StartLimitIntervalSec=0

[Service]
Restart=always
RestartSec=5

EOF

cat >/etc/systemd/journal-upload.conf <<EOF
[Upload]
URL=http://localhost:19532
EOF

systemctl enable --now systemd-journal-upload.service
echo -e "done with sysetemd-journal-upload \e[32m[pass]\e[0m"

fi
