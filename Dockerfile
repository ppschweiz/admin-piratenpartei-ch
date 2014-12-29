FROM ppschweiz/apache

RUN apt-get update && apt-get install -y \
        curl \
        libapache2-mod-php5 \
        php5-mysql \
    && rm -rf /var/lib/apt/lists/*

COPY apache2.conf /etc/apache2/apache2.conf
COPY index.html /var/www/
ADD postfixadmin-2.3.7.tar.gz /var/www/
RUN ln -s /var/www/postfixadmin-2.3.7 /var/www/postfixadmin
COPY config.inc.php /var/www/postfixadmin-2.3.7/config.inc.php

ENV MYSQL_PORT_3306_TCP_ADDR localhost
ENV MYSQL_USERNAME dovecot
ENV MYSQL_PASSWORD changeme
ENV MYSQL_DATABASE postfix
ENV MYSQL_PORT_3306_TCP_PORT 3306
ENV SMTP_PORT_22_TCP_ADDR mail-1-p.piratenpartei.ch
ENV SMTP_PORT_22_TCP_PORT 25
