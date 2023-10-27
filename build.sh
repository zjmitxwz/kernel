os="miui"
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

if [ -f $PWD/out/arch/arm64/boot/Image ]; then
	cp $PWD/out/arch/arm64/boot/Image $PWD/AnyKernel3/kernels/${os}/
else
	exit -1;
fi;

#if [ -f $PWD/out/arch/arm64/boot/dtbo.img ]; then
#	cp $PWD/out/arch/arm64/boot/dtbo.img $PWD/AnyKernel3/kernels/${os}/dtbo.img
#fi;

#if [ -f $PWD/out/arch/arm64/boot/dts/vendor/qcom/kona-v2.1.dtb ]; then
#	cp $PWD/out/arch/arm64/boot/dts/vendor/qcom/kona-v2.1.dtb $PWD/AnyKernel3/kernels/${os}/dtb
#fi;

cd $PWD/AnyKernel3
zip -r9 ${os}-AnyKernel3.zip * -x .git README.md
cp ${os}-AnyKernel3.zip ..

