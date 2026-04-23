#!/bin/bash
printf '%s\n' "# This is a subpolicy to disable Encrypt then MAC" "# for the SSH protocol (libssh and OpenSSH)" "ssh_etm = 0" >> /etc/crypto-policies/policies/modules/NO-SSHETM.pmod
