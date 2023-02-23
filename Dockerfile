FROM alcapone1933/alpine:latest

ENV USER_NAME="admin" \
    USER_PASSWD="admin" \
    PASSWORD_FORMAT="bcrypt" \
    FILE_AUTH="/data/auth" \
    ARGON2_SALT="somesalt"

RUN apk add --update --no-cache apache2-utils bash argon2 \
    && rm -rf /var/cache/apk/*
RUN mkdir /data && touch /data/htpasswd
COPY COPY --chmod=0755 entrypoint.sh /usr/local/bin/entrypoint.sh
# VOLUME [ "/data" ]
ENTRYPOINT ["/sbin/tini", "--"]
# CMD ["htpasswd -Bbn $USER_NAME $USER_PASSWD > /data/htpasswd"]
CMD ["/usr/local/bin/entrypoint.sh"]
