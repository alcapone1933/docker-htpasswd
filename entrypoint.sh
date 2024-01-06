#!/usr/bin/env bash
# https://httpd.apache.org/docs/2.4/misc/password_encryptions.html

sleep 2
echo -n "" > $FILE_AUTH

# echo > /data/auth && echo >> /data/auth
# echo "YOUR PASSWORD: `htpasswd -Bbn $USER_NAME $USER_PASSWD`" >> /data/auth && echo >> /data/auth
# htpasswd -Bbn $USER_NAME $USER_PASSWD >> /data/auth
# sleep 2
# cat /data/auth


if [[ "$PASSWORD_FORMAT" =~ (bcrypt|MD5|SHA1|CRYPT|argon2i|argon2d|argon2id) ]]; then
    if [[ "$PASSWORD_FORMAT" == "bcrypt" ]]; then
        # bcrypt: htpasswd -nbB myName myPassword
        echo > $FILE_AUTH && echo >> $FILE_AUTH
        echo "PASSWORD FORMAT: $PASSWORD_FORMAT, YOUR PASSWORD: `htpasswd -nbB $USER_NAME $USER_PASSWD`" >> $FILE_AUTH && echo >> $FILE_AUTH
        sleep 1
        cat $FILE_AUTH
    elif [[ "$PASSWORD_FORMAT" == "MD5" ]]; then
        # MD5: htpasswd -nbm myName myPassword
        echo > $FILE_AUTH && echo >> $FILE_AUTH
        echo "PASSWORD FORMAT: $PASSWORD_FORMAT, YOUR PASSWORD: `htpasswd -nbm $USER_NAME $USER_PASSWD`" >> $FILE_AUTH && echo >> $FILE_AUTH
        sleep 1
        cat $FILE_AUTH
    elif [[ "$PASSWORD_FORMAT" == "SHA1" ]]; then
        # SHA1: htpasswd -nbs myName myPassword
        echo > $FILE_AUTH && echo >> $FILE_AUTH
        echo "PASSWORD FORMAT: $PASSWORD_FORMAT, YOUR PASSWORD: `htpasswd -nbs $USER_NAME $USER_PASSWD`" >> $FILE_AUTH && echo >> $FILE_AUTH
        sleep 1
        cat $FILE_AUTH
    elif [[ "$PASSWORD_FORMAT" == "CRYPT" ]]; then
        # CRYPT: htpasswd -nbd myName myPassword
        echo > $FILE_AUTH && echo >> $FILE_AUTH
        echo "PASSWORD FORMAT: $PASSWORD_FORMAT, YOUR PASSWORD: `htpasswd -nbd $USER_NAME $USER_PASSWD`" >> $FILE_AUTH && echo >> $FILE_AUTH
        sleep 1
        cat $FILE_AUTH
    elif [[ "$PASSWORD_FORMAT" == "argon2i" ]]; then
        # argon2i: echo -n "myPassword" | argon2 somesalt -i -t 3 -m 16    -p 4 -l 32 -e
        # argon2i: echo -n "myPassword" | argon2 somesalt -i -t 3 -k 65536 -p 4 -l 32 -e
        echo > $FILE_AUTH && echo >> $FILE_AUTH
        PASSWORD_HASH=$(echo -n "$USER_PASSWD" | argon2 "$ARGON2_SALT" -i -t 3 -m 16 -p 4 -l 32 -e)
        PASSWORD_HASH_SED=$(echo "$PASSWORD_HASH" | sed 's#\$#\$\$#g')
        echo "PASSWORD FORMAT: $PASSWORD_FORMAT, YOUR PASSWORD: $USER_NAME:$PASSWORD_HASH" >> $FILE_AUTH && echo >> $FILE_AUTH
        # echo "PASSWORD FORMAT: $PASSWORD_FORMAT, YOUR PASSWORD: $USER_NAME:`echo "$USER_PASSWD" | argon2 "$ARGON2_SALT" -i -t 3 -m 16 -p 4 -l 32 -e`" >> $FILE_AUTH && echo >> $FILE_AUTH
        echo "FOR DOCKER-COMPOSE: environment: - PASSWORD=${PASSWORD_HASH_SED}" >> $FILE_AUTH && echo >> $FILE_AUTH
        sleep 1
        cat $FILE_AUTH
    elif [[ "$PASSWORD_FORMAT" == "argon2d" ]]; then
        # argon2d: echo -n "myPassword" | argon2 somesalt -d -t 3 -m 16    -p 4 -l 32 -e
        # argon2d: echo -n "myPassword" | argon2 somesalt -d -t 3 -k 65536 -p 4 -l 32 -e
        echo > $FILE_AUTH && echo >> $FILE_AUTH
        PASSWORD_HASH=$(echo -n "$USER_PASSWD" | argon2 "$ARGON2_SALT" -d -t 3 -m 16 -p 4 -l 32 -e)
        PASSWORD_HASH_SED=$(echo "$PASSWORD_HASH" | sed 's#\$#\$\$#g')
        echo "PASSWORD FORMAT: $PASSWORD_FORMAT, YOUR PASSWORD: $USER_NAME:$PASSWORD_HASH" >> $FILE_AUTH && echo >> $FILE_AUTH
        # echo "PASSWORD FORMAT: $PASSWORD_FORMAT, YOUR PASSWORD: $USER_NAME:`echo "$USER_PASSWD" | argon2 "$ARGON2_SALT" -d -t 3 -m 16 -p 4 -l 32 -e`" >> $FILE_AUTH && echo >> $FILE_AUTH
        echo "FOR DOCKER-COMPOSE: environment: - PASSWORD=${PASSWORD_HASH_SED}" >> $FILE_AUTH && echo >> $FILE_AUTH
        sleep 1
        cat $FILE_AUTH
    elif [[ "$PASSWORD_FORMAT" == "argon2id" ]]; then
        # argon2id: echo -n "myPassword" | argon2 somesalt -id -t 3 -m 16    -p 4 -l 32 -e
        # argon2id: echo -n "myPassword" | argon2 somesalt -id -t 3 -k 65536 -p 4 -l 32 -e
        echo > $FILE_AUTH && echo >> $FILE_AUTH
        PASSWORD_HASH=$(echo -n "$USER_PASSWD" | argon2 "$ARGON2_SALT" -id -t 3 -m 16 -p 4 -l 32 -e)
        PASSWORD_HASH_SED=$(echo "$PASSWORD_HASH" | sed 's#\$#\$\$#g')
        echo "PASSWORD FORMAT: $PASSWORD_FORMAT, YOUR PASSWORD: $USER_NAME:$PASSWORD_HASH" >> $FILE_AUTH && echo >> $FILE_AUTH
        # echo "PASSWORD FORMAT: $PASSWORD_FORMAT, YOUR PASSWORD: $USER_NAME:`echo "$USER_PASSWD" | argon2 "$ARGON2_SALT" -id -t 3 -m 16 -p 4 -l 32 -e`" >> $FILE_AUTH && echo >> $FILE_AUTH
        echo "FOR DOCKER-COMPOSE: environment: - PASSWORD=${PASSWORD_HASH_SED}" >> $FILE_AUTH && echo >> $FILE_AUTH
        sleep 1
        cat $FILE_AUTH
    fi
else
    echo
    echo "ERROR Variable PASSWORD_FORMAT is Wrong"
    echo
    exit 1
fi
exit 0
