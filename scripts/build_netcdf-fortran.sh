#!/bin/sh

yum install -y cmake
version=4.4.4
wget https://github.com/Unidata/netcdf-fortran/archive/v$version.tar.gz -O netcdf-fortran-$version.tar.gz
tar -xf netcdf-fortran-$version.tar.gz
PREFIX=/work/local/
echo "PREFIX" $PREFIX

cd netcdf-fortran-$version

# below is lightly changed from
# https://github.com/conda-forge/netcdf-fortran-feedstock/blob/master/recipe/build.sh
export LIBRARY_SEARCH_VAR=LD_LIBRARY_PATH
export LDFLAGS="$LDFLAGS -L$PREFIX/lib -Wl,-rpath,$PREFIX/lib"
export CFLAGS="$CFLAGS fPIC -I$PREFIX/include"

# Build static.
mkdir build_static && cd build_static
cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_INSTALL_LIBDIR:PATH=$PREFIX/lib \
      -D BUILD_SHARED_LIBS=OFF \
      $SRC_DIR

make
# ctest  # Run only for the shared lib build to save time.
make install

cd ../../
