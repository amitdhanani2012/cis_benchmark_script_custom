#!/bin/bash

if grep -q "^Ciphers" /etc/ssh/sshd_config;then

sed -i '/^Ciphers/s/Ciphers.*/Ciphers \-3des\-cbc,aes128\-cbc,aes192\-cbc,aes256\-cbc,chacha20\-poly1305@openssh\.com/' /etc/ssh/sshd_config
#echo "Ciphers change for ssh"
systemctl restart sshd
else
echo "Ciphers -3des-cbc,aes128-cbc,aes192-cbc,aes256-cbc,chacha20-poly1305@openssh.com" >> /etc/ssh/sshd_config
#echo "Ciphers done"
systemctl restart sshd
fi
if sshd -T |grep -i "ciphers" |grep  -e "3des\-cbc" -e "aes128\-cbc" -e "aes192\-cbc" -e "aes256\-cbc" -e "chacha20\-poly1305@openssh\.com";then
echo "Weak Cipher removal is not done"
else
echo "Weak Cipher removal is done"
fi
