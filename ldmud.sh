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
