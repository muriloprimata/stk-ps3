#!/bin/sh
set -e
export PS3DEV="${PS3DEV:-/usr/local/ps3dev}"
export PSL1GHT="${PSL1GHT:-$PS3DEV}"
echo "PS3DEV=$PS3DEV"
ls "$PS3DEV/ppu/bin" | head -5
command -v cmake >/dev/null || { apt-get update && apt-get install -y cmake make || apk add --no-cache cmake make; }
LIB="$1"
mkdir -p "build/$LIB"
cd "build/$LIB"
cmake -DCMAKE_TOOLCHAIN_FILE=/build/ps3/cmake/ps3.toolchain.cmake -DCMAKE_BUILD_TYPE=Release "/build/lib/$LIB"
make -j"$(nproc)"
