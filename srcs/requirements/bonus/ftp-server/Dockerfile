FROM debian:buster

RUN apt update; \
    apt install -y vsftpd

COPY ./conf/vsftpd.conf /var/www/vsftpd.conf
COPY ./conf/setup.sh /var/www/setup.sh

CMD ["bash", "/var/www/setup.sh"]
