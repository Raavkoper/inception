#!bin/bash

if [ ! -d /run/mysqld ] #checks if the database is not already set up
then

	echo "Setting up MariaDB"

	# Create the run directory for mysqld
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
	chown -R mysql:mysql /var/lib/mysql

	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql #initializes database

# Creates a temporary file to store the SQL commands to be executed, creates the database and the users
cat << EOF > init.sql
	USE mysql;
	FLUSH PRIVILEGES;

	DELETE FROM mysql.user WHERE User='';
	DROP DATABASE test;
	DELETE FROM mysql.db WHERE Db='test';

	ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD';

	CREATE DATABASE IF NOT EXISTS $DB_NAME;

	CREATE USER '$DB_USER'@'%';
	SET PASSWORD FOR '$DB_USER'@'%' = PASSWORD('$DB_PASSWORD');
	GRANT ALL PRIVILEGES ON wordpress.* TO '$DB_USER'@'%';
	GRANT ALL ON wordpress.* to '$DB_USER'@'%';
	FLUSH PRIVILEGES;

	CREATE USER '$WP_SECOND_USER'@'%';
	SET PASSWORD FOR '$WP_SECOND_USER'@'%' = PASSWORD('$WP_SECOND_USER_PASSWORD');
EOF

mysqld --user=mysql --bootstrap < init.sql

fi

echo "MariaDB started"

exec mysqld --user=mysql --console #starts database server in foreground