#!/bin/bash

export PATH=$HOME/toolchains/lilium-clang/bin:$PATH
export CROSS_COMPILE=$HOME/toolchains/lilium-clang/bin/aarch64-linux-gnu-
export CC=$HOME/toolchains/lilium-clang/bin/clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
export PLATFORM_VERSION=14
export TARGET_SOC=mt6877
export TARGET_BUILD_VARIANT=user

export KCFLAGS=-w
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y

make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y LLVM=1 LLVM_IAS=1 niigo_defconfig
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y LLVM=1 LLVM_IAS=1 -j$(nproc --all)
