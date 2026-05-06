#!/bin/bash
echo -e "\e[32mNull password not allowed started\e[0m"
authselect enable-feature without-nullok >/dev/null
authselect apply-changes 

authselect current |grep -q -i "without-nullok" &&  echo -e "without-nullok done \e[32m[pass]\e[0m"
