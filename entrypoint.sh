#!/usr/bin/env sh
sleep 5
htpasswd -Bbn $USER_NAME $USER_PASSWD > /data/htpasswd
sleep 2
cat /data/htpasswd