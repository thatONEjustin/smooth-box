#!/bin/bash

sudo /usr/sbin/iptables -t nat -A PREROUTING -i enp9s0 -p tcp --dport 80 -j REDIRECT --to-port 6969

HOST=192.168.0.31 PORT=6969 SERVER_KEY_PATH=/usr/local/bin/smooth-box-key.pem SERVER_CERT_PATH=/usr/local/bin/smooth-box.pem /home/justinprime/.nvm/versions/node/v20.8.0/bin/node /home/justinprime/git/homelab-home/dist/server/entry.mjs
