FROM debian:bullseye

EXPOSE 3306

# RUN apt-get update && apt-get -y install mariadb-server mariadb-client
RUN apt update -y && apt install mariadb-server -y

COPY ./tools/db_setup_script.sh .

COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x db_setup_script.sh

ENTRYPOINT ["./db_setup_script.sh" ]
