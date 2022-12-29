#!/bin/bash -ex

git clone -b develop https://github.com/intel/CacheLib CacheLib

cd CacheLib

git checkout 265c312de090cc735fb51d278a116c360bab19c8

# Add multi-tier navy benchmark (21 Dec 2022)
./contrib/prerequisites-centos8.sh

for pkg in zstd googleflags googlelog googletest sparsemap fmt folly fizz wangle fbthrift ;
do
    ./contrib/build-package.sh -j -I /opt/ "$pkg"
done

mkdir build
cd build

cmake ../cachelib -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/opt
make install -j $(nproc)

cd ../..
rm -rf CacheLib
