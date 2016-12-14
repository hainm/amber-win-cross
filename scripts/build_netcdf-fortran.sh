#!/bin/sh

version=4.4.4
wget https://github.com/Unidata/netcdf-fortran/archive/v$version.tar.gz -O netcdf-fortran-$version.tar.gz
tar -xf netcdf-fortran-$version.tar.gz
PREFIX=/work/local/
echo "PREFIX" $PREFIX

cd netcdf-fortran-$version
SRC_DIR=`pwd`
echo "SRC_DIR" ${SRC_DIR}

export LIBRARY_SEARCH_VAR=LD_LIBRARY_PATH

# Build static.
mkdir build_static && cd build_static
./configure --prefix=$PREFIX \
            --diable-shared \
            CPPFLAGS=-I/work/local/include \
            LDFLAGS=-L/work/local/lib -lnetcdf \
            --host=x86_64-w64-mingw3

make
make install
make test

cd ../../
