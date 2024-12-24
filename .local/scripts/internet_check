#!/bin/bash

SERVER=192.168.0.1

if ping -c 5 $SERVER >/dev/null 2>&1; then
  echo "$SERVER ✓"
else
  echo "$SERVER ✗"
  reboot
fi
