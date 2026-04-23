#!/bin/bash

printf '%s\n' "# This is a subpolicy to disable weak MACs" "# for the SSH protocol (libssh and OpenSSH)" "mac@SSH = -HMAC-MD5* -UMAC-64* -UMAC-128*" >>/etc/crypto-policies/policies/modules/NO-SSHWEAKMACS.pmod
echo "No ssh weak mac done"
