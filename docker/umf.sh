#!/bin/bash -ex

git clone https://github.com/oneapi-src/unified-memory-framework
cd unified-memory-framework
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DUMF_BUILD_SHARED_LIBRARY=1
make -j$(nproc)
make install
