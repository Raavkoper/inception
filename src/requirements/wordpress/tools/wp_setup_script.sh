if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
    echo "Downloading wordpress"
    wget https://wordpress.org/latest.tar.gz
    tar -xvf latest.tar.gz
    mv wordpress/* .
    rm -rf wordpress
    rm latest.tar.gz

    echo "Configuring wordpress"
    sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
    sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
    sed -i "s/password_here/$DB_PASSWORD/g" wp-config-sample.php
    sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
    mv wp-config-sample.php wp-config.php
    
fi