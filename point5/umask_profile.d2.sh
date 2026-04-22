#!/bin/bash
printf '%s\n' "" "umask 027" >> /etc/profile.d/60-default_umask.sh
echo "umask file added in profile.d"
