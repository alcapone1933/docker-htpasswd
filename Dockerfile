FROM alpine:latest
ENV USER_NAME="admin" \
    USER_PASSWD="admin" \
    PASSWORD_FORMAT="bcrypt" \
    FILE_AUTH="/data/auth"
RUN apk add --update --no-cache apache2-utils bash \
    && rm -rf /var/cache/apk/*
RUN mkdir /data && touch /data/htpasswd
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 777 /usr/local/bin/entrypoint.sh
VOLUME [ "/data" ]
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
# CMD ["htpasswd -Bbn $USER_NAME $USER_PASSWD > /data/htpasswd"]
