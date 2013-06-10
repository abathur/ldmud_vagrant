git clone https://github.com/doxygen/doxygen.git
cd doxygen
./configure
make
make distclean
git pull
./configure
make
make install
