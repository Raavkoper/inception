FROM debian:buster

RUN apt-get update && apt-get -y install php

RUN mkdir -p /run/php

COPY ./tools/wp_setup_script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_setup_script.sh
ENTRYPOINT ["/usr/local/bin/wp_setup_script.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]