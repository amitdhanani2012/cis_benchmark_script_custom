#!/bin/bash
echo -e "\e[32mUmask file adding started\e[0m"
printf '%s\n' "" "umask 027" > /etc/profile.d/60-default_umask.sh
echo -e "umask file added in profile.d \e[32m[pass]\e[0m"
