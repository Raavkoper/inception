# FROM debian:bullseye

# # RUN apt-get update && apt-get -y install php wget php7.4-fpm php7.4-mysql mariadb-client

# # Update the package list
# RUN 	apt update -y

# # Install the required packages
# RUN 	apt install -y					\
# 					wget				\
# 					php7.4-fpm			\
# 					php7.4-mysql		\
# 					mariadb-client

# COPY ./www.conf /etc/php/7.4/fpm/pool.d/www.conf

# # RUN sed 's|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:9000|g' -i /etc/php/7.3/fpm/pool.d/www.conf
# RUN mkdir -p /run/php

# COPY ./tools/wp_setup_script.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/wp_setup_script.sh

# RUN 	wget "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
# x
# RUN 	chmod +x wp-cli.phar
# RUN 	mv wp-cli.phar /usr/local/bin/wp

# WORKDIR /var/www/html/

# EXPOSE 9000

# ENTRYPOINT [ "/usr/local/bin/wp_setup_script.sh" ]



FROM 	debian:bullseye

# Expose the port
EXPOSE 	9000

# Update the package list
RUN 	apt update -y

# Install the required packages
RUN 	apt install -y					\
					wget				\
					php7.4-fpm			\
					php7.4-mysql		\
					mariadb-client

# Install WordPress Command Line Interface
RUN 	wget "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"

# Copy the php-fpm configuration file
COPY 	tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Make the file executable and move it to the bin directory to use it globally
RUN 	chmod +x wp-cli.phar
RUN 	mv wp-cli.phar /usr/local/bin/wp

# Make run dir
RUN 	mkdir -p /run/php

# Copy the script to install WordPress
COPY 	tools/wp_setup_script.sh .
RUN 	chmod +x wp_setup_script.sh

# Start the script
ENTRYPOINT [ "./wp_setup_script.sh" ]