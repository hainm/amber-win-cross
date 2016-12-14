#!/bin/sh

PREFIX=/work/local/
version=4.4.4.1
yum install unzip -y
curl -fsS -o netcdf-$version.zip ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-$version.zip
unzip netcdf-$version.zip
cd netcdf-$version
./configure --prefix=$PREFIX --enable-static --disable-netcdf-4 --disable-dap --host=x86_64-w64-mingw32
make -r install
make test
