FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server mariadb-client

COPY ./tools/db_setup_script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/db_setup_script.sh

RUN sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' -i  /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed 's/skip-networking/#skip-networking/g' -i  /etc/mysql/mariadb.conf.d/50-server.cnf 

ENTRYPOINT [ "/usr/local/bin/db_setup_script.sh" ]