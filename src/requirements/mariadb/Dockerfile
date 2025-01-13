FROM debian:bullseye

EXPOSE 3306

# RUN apt-get update && apt-get -y install mariadb-server mariadb-client
RUN apt update -y && apt install mariadb-server -y

COPY ./tools/db_setup_script.sh .

COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x db_setup_script.sh

# RUN sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' -i  /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN sed 's/skip-networking/#skip-networking/g' -i  /etc/mysql/mariadb.conf.d/50-server.cnf 

ENTRYPOINT ["./db_setup_script.sh" ]
