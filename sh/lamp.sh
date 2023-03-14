yum -y install httpd httpd-manual mod_ssl mod_perl mod_auth_mysql unzip  php php-mysql gd php-gd gd-devel php-xml php-common php-mbstring php-ldap php-pear php-xmlrpc php-imap
systemctl start httpd
wget http://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm
yum -y install mysql57-community-release-el7-10.noarch.rpm
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
yum -y install mysql mysql-server mysql-community-server
systemctl restart httpd
mkdir -p /var/www/html/phpmyadmin
wget https://labfileapp.oss-cn-hangzhou.aliyuncs.com/phpMyAdmin-4.0.10.20-all-languages.zip --no-check-certificate
unzip phpMyAdmin-4.0.10.20-all-languages.zip
mv phpMyAdmin-4.0.10.20-all-languages/*  /var/www/html/phpmyadmin
