FROM 	debian:bullseye

EXPOSE 	9000

RUN 	apt update -y

RUN 	apt install -y					\
					wget				\
					php7.4-fpm			\
					php7.4-mysql		\
					mariadb-client

RUN 	wget "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"

COPY 	tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN 	chmod +x wp-cli.phar
RUN 	mv wp-cli.phar /usr/local/bin/wp

RUN 	mkdir -p /run/php

COPY 	tools/wp_setup_script.sh .
RUN 	chmod +x wp_setup_script.sh

ENTRYPOINT [ "./wp_setup_script.sh" ]