#!/bin/sh

mkdir local/
yum install unzip -y
curl -fsS -o netcdf-4.3.3.zip ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.3.3.zip
unzip netcdf-4.3.3.zip
cd netcdf-4.3.3
./configure --prefix=`pwd`/local --enable-static --disable-netcdf-4 --prefix=/usr/local/ --disable-dap --host=x86_64-w64-mingw32
make -r install
