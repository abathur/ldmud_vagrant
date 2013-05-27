export DEBIAN_FRONTEND=noninteractive
sudo su
apt-get update -q
apt-get install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" screen curl git libiksemel3 libiksemel-dev
echo "deb http://packages.dotdeb.org stable all" >> /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org stable all" >> /etc/apt/sources.list
curl http://www.dotdeb.org/dotdeb.gpg | apt-key add -
curl http://repo.varnish-cache.org/debian/GPG-key.txt | apt-key add -
#echo "deb http://repo.varnish-cache.org/debian/ stable varnish-3.0" >> /etc/apt/sources.list
echo "mysql-server-5.1 mysql-server/root_password password vagrant" | sudo debconf-set-selections
echo "mysql-server-5.1 mysql-server/root_password_again password vagrant" | sudo debconf-set-selections
apt-get install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" mysql-server-5.1 mysql-server mysql-client php5-cli php-pear php5-mysql libmysqlclient-dev php5-curl redis-server nginx autoconf libtool flex bison gdb varnish libaprutil1-dev apache2.2-common shtool php5-dev apache2-prefork-dev libjson0 libjson0-dev
printf "\n" | sudo pecl install apc
git clone https://github.com/ldmud/ldmud.git
cd ldmud/src
git checkout tags/3.3.720
bash autogen.sh
autoconf autoconf/configure.in > configure
export CFLAGS="-m64 -mtune=core2"
export LDFLAGS="-m64 -mtune=core2"
export EXTRA_CFLAGS=$CFLAGS
bash configure --prefix=/usr/users --enable-compat-mode --enable-erq=xerq --with-erq-debug=0 --with-read-file-max-size=300000 --with-master-name=obj/master --with-max-array-size=0 --with-max-mapping-size=0 --with-max-mapping-keys=0 --with-max-players=100 --with-max-cost=5000000 --with-hard-malloc-limit=0 --enable-use-mysql --enable-use-sqlite --enable-use-mccp --enable-use-json --enable-use-pcre=builtin --enable-use-xml=yes --enable-use-tls --with-portno=2777 --with-max-user-trace=260 --with-max-trace=270 LDFLAGS=-L/usr/lib64/mysql --with-pcre-recursion-limit=0 --with-evaluator_stack_size=20000
make
make install-all
mv ldmud /usr/bin/ldmud
ldmud -m /home/vagrant/ldmud/mud/lp-245 23
