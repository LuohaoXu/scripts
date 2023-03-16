yum -y install httpd httpd-manual mod_ssl mod_perl mod_auth_mysql unzip  php php-mysql gd php-gd gd-devel php-xml php-common php-mbstring php-ldap php-pear php-xmlrpc php-imap
systemctl start httpd
rpm -ivh http://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm
yum -y install mysql-community-server --nogpgcheck
systemctl start mysqld
grep 'password' /var/log/mysqld.log | cut -d ":" -f4  > ~/.bashsrc
sed -i "s/ /export a='/g" .bashsrc
sed -i "s/$/&'/g " .bashsrc
source ~/.bashsrc
mysql -uroot -p$a
set global validate_password_policy=0; 
ALTER USER 'root'@'localhost' IDENTIFIED BY '12345678';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '12345678';
exit;
mkdir -p /var/www/html/phpmyadmin
wget https://labfileapp.oss-cn-hangzhou.aliyuncs.com/phpMyAdmin-4.0.10.20-all-languages.zip --no-check-certificate
unzip phpMyAdmin-4.0.10.20-all-languages.zip
mv phpMyAdmin-4.0.10.20-all-languages/*  /var/www/html/phpmyadmin
systemctl restart httpd