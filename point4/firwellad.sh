#!/bin/bash

firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --zone=public --permanent --add-service=ssh
firewall-cmd --zone=public --permanent --add-service=https
firewall-cmd --zone=public --permanent --add-port=10020-10022/tcp
firewall-cmd --zone=public --permanent --list-ports
firewall-cmd --reload
