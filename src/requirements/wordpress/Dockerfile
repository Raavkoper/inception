FROM debian:buster

RUN apt-get update && apt-get -y install php wget php-fpm php-mysql


COPY ./www.conf /etc/php/7.3/fpm/pool.d/

RUN sed 's|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:9000|g' -i /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir -p /run/php

COPY ./tools/wp_setup_script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_setup_script.sh

WORKDIR /var/www/html/

EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/wp_setup_script.sh" ]