FROM debian:buster

RUN apt update; \
    apt install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow/O=School21/OU=Wave8/CN=bcaffere"

COPY ./conf/default etc/nginx/sites-enabled/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
