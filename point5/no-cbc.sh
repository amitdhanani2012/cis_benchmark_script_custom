#!/bin/bash
printf '%s\n' "# This is a subpolicy to disable all CBC mode ciphers" "#for the SSH protocol (libssh and OpenSSH)" "cipher@SSH = -*-CBC" >>/etc/crypto-policies/policies/modules/NO-SSHCBC.pmod
