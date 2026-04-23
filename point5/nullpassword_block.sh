#!/bin/bash

authselect enable-feature without-nullok >/dev/null
authselect apply-changes 

authselect current |grep -q -i "without-nullok" &&  echo "without-nullok done"
