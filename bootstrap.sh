# export DEBIAN_FRONTEND=noninteractive
# sudo su
# apt-get update -q
# apt-get install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" screen curl git libiksemel3 libiksemel-dev
# echo "deb http://packages.dotdeb.org stable all" >> /etc/apt/sources.list
# echo "deb-src http://packages.dotdeb.org stable all" >> /etc/apt/sources.list
# curl http://www.dotdeb.org/dotdeb.gpg | apt-key add -
# curl http://repo.varnish-cache.org/debian/GPG-key.txt | apt-key add -
# #echo "deb http://repo.varnish-cache.org/debian/ stable varnish-3.0" >> /etc/apt/sources.list
# echo "mysql-server-5.1 mysql-server/root_password password vagrant" | sudo debconf-set-selections
# echo "mysql-server-5.1 mysql-server/root_password_again password vagrant" | sudo debconf-set-selections
# apt-get install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" mysql-server-5.1 mysql-server mysql-client php5-cli php-pear php5-mysql libmysqlclient-dev php5-curl redis-server nginx autoconf libtool flex bison gdb varnish libaprutil1-dev apache2.2-common shtool php5-dev apache2-prefork-dev libjson0 libjson0-dev
# printf "\n" | sudo pecl install apc
