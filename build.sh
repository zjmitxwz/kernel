clang="/home/hech/clang/clang1800/bin"
args=" -j6 \
        ARCH=arm64 \
        O=out \
        CC=${clang}/clang \
        CROSS_COMPILE=${clang}/aarch64-linux-gnu- \
        NM=${clang}/llvm-nm \
        OBJDUMP=${clang}/llvm-objdump \
        STRIP=${clang}/llvm-strip \
	CROSS_COMPILE_ARM32=${clang}/arm-linux-gnueabi- \
	LLVM=1 \
	LLVM_IAS=1 \
	PYTHON=python3
"
make $args umi_defconfig
make $args
