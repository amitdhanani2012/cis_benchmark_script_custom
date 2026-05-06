#!/bin/bash

echo -e "\e[32mWeak cipher and mac removal started\e[0m"
bash no-sha1.sh
bash no-weakmac.sh
bash no-cbc.sh
bash no-SSHCHACHA20.sh 
bash no-sshetm.sh
bash nosshweakciper.sh
bash no-sshweakmac.sh

#update-crypto-policies --set DEFAULT:NO-SHA1:NO-WEAKMAC:NO-SSHCBC:NO-SSHCHACHA20:NO-SSHETM
#update-crypto-policies --set DEFAULT:AD-SUPPORT:NO-SHA1:NO-WEAKMAC:NO-SSHCBC:NO-SSHCHACHA20:NO-SSHWEAKCIPHERS
update-crypto-policies --set DEFAULT:AD-SUPPORT:NO-SHA1:NO-WEAKMAC:NO-SSHCBC:NO-SSHCHACHA20:NO-SSHETM:NO-SSHWEAKCIPHERS:NO-SSHWEAKMACS
if echo $?;then
systemctl reset-failed sshd
systemctl reload-or-restart sshd
echo -e "done all weak ciphers and mac out \e[32m[pass]\e[0m"
echo -e "\e[32mREBOOT NEEDED\e[0m"
fi

