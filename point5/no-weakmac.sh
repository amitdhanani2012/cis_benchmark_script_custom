#!/bin/bash

printf '%s\n' "# This is a subpolicy to disable weak macs" "mac = -*-128" >> /etc/crypto-policies/policies/modules/NO-WEAKMAC.pmod
