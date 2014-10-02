FROM php:apache

RUN apt-get update && apt-get install -y php5-mysql
COPY apache2.conf /etc/apache2/apache2.conf
COPY index.html /usr/share/html/
ADD postfixadmin-2.91.tar.gz /usr/share/html/
RUN ln -s /usr/share/html/postfixadmin-2.91 /usr/share/html/postfixadmin
COPY config.inc.php /usr/share/html/postfixadmin-2.91/config.inc.php

ENV MYSQL_PORT_3306_TCP_ADDR localhost
ENV MYSQL_USERNAME dovecot
ENV MYSQL_PASSWORD changeme
ENV MYSQL_DATABASE postfix
ENV MYSQL_PORT_3306_TCP_PORT 3306
ENV SMTP_PORT_22_TCP_ADDR mail-1-p.piratenpartei.ch
ENV SMTP_PORT_22_TCP_PORT 25

COPY phpinfo.php /usr/share/html/phpinfo.php
RUN chown www-data.www-data -R  /usr/share/html/postfixadmin-2.91/templates_c
