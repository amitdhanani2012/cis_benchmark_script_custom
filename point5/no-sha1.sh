#!/bin/bash
printf '%s\n' "# This is a subpolicy dropping the SHA1 hash and signature support" "hash = -SHA1" "sign = -*-SHA1" "sha1_in_certs = 0" >> /etc/crypto-policies/policies/modules/NO-SHA1.pmod
#update-crypto-policies --set DEFAULT:NO-SHA1
