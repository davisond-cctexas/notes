#!/bin/bash
http://52.243.27.107/
sudo chown -R $USER:$USER /var/www/coastalbendstormexpo.com/public_html
sudo chown -R $USER:$USER /var/www/water.calculator.cctexas.com/public_html
# EDITING SITE
sudo cp /etc/apache2/sites-available/coastalbendstormexpo.com.conf /etc/apache2/sites-available//water.calculator.cctexas.com.conf
sudo a2ensite water.calculator.cctexas.com.conf
sudo a2ensite coastalbendstormexpo.com.conf
ServerName coastalbendstormexpo.com
ServerAlias www.coastalbendstormexpo.com
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/coastalbendstormexpo.com.conf
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/water.calculator.cctexas.com.conf

I already created configured and enabled virtual hosting server:

Config files
/etc/apache2/sites-available/coastalbendstormexpo.com.conf
 /etc/apache2/sites-available/water.calculator.cctexas.com.conf


davisond@13.72.177.88 Public Port: 62664
SSH-PrivateKey: WebAdmin091501!
davisond-cctexas
Velu12!@#$
WebAdmin.ppk & WebAdmin.pub
davisond@13.72.177.88 DavidD091501!
################################################################# PROVISIONING ################################################################# 
git config --global http.sslverify false
git clone https://github.com/davisond-cctexas/corpus-christi-intranet.git
mysqladmin -u root -p create cctx_intranet_db
mysql -u root -p
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER,
CREATE TEMPORARY TABLES ON cctx_intranet_db.*
TO 'root'@'localhost' IDENTIFIED BY 'velu12';
chmod -R 777 sites/default/settings.php
mkdir files; chmod -R 777  files/
apt install composer

git remote set-url origin https://github.com/davisond-cctexas/corpus-christi-intranet.git

curl -k https://getcomposer.org/installer | php
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
ln -s /usr/local/bin/composer /usr/bin/composer

git clone https://github.com/drush-ops/drush.git /usr/local/src/drush
cd /usr/local/src/drush
git checkout 7.0.0-alpha5  #or whatever version you want.
ln -s /usr/local/src/drush/drush /usr/bin/drush
composer install
drush --version




 echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc



################################################################# GLOBALS ################################################################# 
user="root"
password="Velu12!@#$"
database="cctx_intranet_db"



# deploy latest changes

cd /home/davisond/corpus-christi-intranet/
git checkout latest

cd ~/corpus-christi-cms && \
git fetch origin && \                                                           
git checkout -f origin/master && \
composer update --prefer-dist -vvv --profile && \
cd web && \
drush cr && \
drush updb -y && \
drush entity-updates -y




# Revert back to working version

cd /home/davisond/corpus-christi-intranet/
git checkout working





 mysqldump -u root -p cctx_intranet_db > backup.sql

  mysql -u root -p cctx_intranet_db < backup.sql






if [ $# -ne 3 ];
then
  echo "syntax: import_mysql_db <database_user> <database_name> <sql_file>";
  exit 1;
fi;

database_user=$1
database_name=$2
sql_file=$3

if [ ! -f $sql_file ];
then
  echo "File $sql_file does not exist!"
  exit 1;
fi;

# Drop the database (it will ask to confirm)
mysqladmin -u$database_user drop $database_name
mysqladmin -u$database_user create $database_name

# Import the database (and use pv)
pv $sql_file | mysql -u$database_user $database_name


mysql --user="$user" --password="$password" --database="$database" --execute="DROP DATABASE $user; CREATE DATABASE $database;"


drush site-install cctexas -y -q --db-url=mysql://root:velu12@db:3306/$MYSQL_DATABASE --account-name=$DRUPAL_USER --account-pass=$DRUPAL_PASSWORD

# install lamp
#sudo apt-get install apache2
#sudo apt-get install mysql-server
#sudo apt-get install php5 libapache2-mod-php5
#sudo /etc/init.d/apache2 restart
#php -r 'echo "\n\nYour PHP installation is working fine.\n\n\n";'
#sudo apt-get install lamp-server^
