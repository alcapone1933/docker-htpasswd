#!/usr/bin/env sh
sleep 5
echo -n "" > /data/htpasswd
echo > /data/htpasswd && echo >> /data/htpasswd
echo "YOUR PASSWORD: `htpasswd -Bbn $USER_NAME $USER_PASSWD`" >> /data/htpasswd && echo >> /data/htpasswd
# htpasswd -Bbn $USER_NAME $USER_PASSWD >> /data/htpasswd
sleep 2
cat /data/htpasswd
