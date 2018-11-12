#filename: Vagrantfile.provision.sh
#!/usr/bin/env bash

# + MySQL 5.6


# ---------------------------------------------------------------------------------------------------------------------
# Variables & Functions
# ---------------------------------------------------------------------------------------------------------------------
APP_DATABASE_NAME='wordpress'

echoTitle () {
    echo -e "\033[0;30m\033[42m -- $1 -- \033[0m"
}
# ---------------------------------------------------------------------------------------------------------------------
# echoTitle 'MYSQL-Database'
# ---------------------------------------------------------------------------------------------------------------------
# Setting MySQL (username: root) ~ (password: root)
sudo debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password_again password root'

# Installing packages
sudo apt-get install -y mysql-server-5.6 mysql-client-5.6 mysql-common-5.6
sudo apt-get update
sudo apt-get install -y mysql-server

# Setup database
mysql -uroot -proot -e "CREATE DATABASE IF NOT EXISTS $APP_DATABASE_NAME;";
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root';"
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root';"

# changing bind address

sudo sed -i 's|127.0.0.1|0.0.0.0|g' /etc/mysql/my.cnf

sudo service mysql restart

# Import SQL file
cd /vagrant

mysql -uroot -proot wordpress < conf/wordpress.sql

sudo service mysql restart