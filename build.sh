#!/bin/bash
#
# Build the SuvKernel Image for redwood.
#
# Usage: ./build.sh
# Neutron Clang is taken from ~/toolchains/neutron-clang, or from $CLANG.
#

set -e

cd "$(dirname "$0")"

CLANG=${CLANG:-$HOME/toolchains/neutron-clang}
export PATH="$CLANG/bin:$PATH"

export KBUILD_BUILD_USER=suvojeet-sengupta KBUILD_BUILD_HOST=suvkernel

ARGS=(ARCH=arm64 LLVM=1 LLVM_IAS=1
      CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_COMPAT=arm-linux-gnueabi-
      KCFLAGS=-ffile-prefix-map="$PWD"/= KAFLAGS=-ffile-prefix-map="$PWD"/=)

make -j"$(nproc)" O=out "${ARGS[@]}" vendor/xiaomi-qgki_defconfig
scripts/kconfig/merge_config.sh -O out -m out/.config \
    arch/arm64/configs/vendor/redwood.config \
    arch/arm64/configs/vendor/vajra.config \
    arch/arm64/configs/vendor/suvkernel.config
make -j"$(nproc)" O=out "${ARGS[@]}" olddefconfig
make -j"$(nproc)" O=out "${ARGS[@]}" Image

echo "Image: $PWD/out/arch/arm64/boot/Image"
