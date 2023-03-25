yum -y install httpd httpd-manual mod_ssl mod_perl unzip php php-mysql gd php-gd gd-devel php-xml php-common php-mbstring php-ldap php-pear php-xmlrpc php-imap
yum -y install httpd httpd-devel
# systemctl start httpd
rpm -ivh http://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm
yum -y install mysql-community-server --nogpgcheck
systemctl start mysqld
a=$(grep -Eo 'A temporary password is generated for root@localhost: (.*)' /var/log/mysqld.log | sed "s/A temporary password is generated for root@localhost: //g")
mysql -uroot -p"$a" -e"set global validate_password_policy=0; ALTER USER 'root'@'localhost' IDENTIFIED BY '12345678';GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '12345678';" --connect-expired-password
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
mkdir -p /var/www/html/phpmyadmin
wget https://labfileapp.oss-cn-hangzhou.aliyuncs.com/phpMyAdmin-4.0.10.20-all-languages.zip --no-check-certificate
unzip phpMyAdmin-4.0.10.20-all-languages.zip
mv phpMyAdmin-4.0.10.20-all-languages/*  /var/www/html/phpmyadmin
systemctl restart httpd
