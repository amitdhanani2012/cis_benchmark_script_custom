#!/bin/bash
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
systemctl reload-or-restart sshd
echo "done all weak ciphers and mac out"
fi

