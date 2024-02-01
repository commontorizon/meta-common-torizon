do_install:append() {

    # Adapted backport from the following langdale commit:
    # https://git.openembedded.org/openembedded-core/commit/meta/recipes-kernel/linux/kernel-devsrc.bb?h=langdale&id=7b195d7be1d0db1ad8024494ff990717bd30aea4
    ######################################################################################################
    if [ "${ARCH}" = "arm64" ]; then
        (
        cd ${S}
        # Needed for kernel 5.19+
        cp -a --parents arch/arm64/tools/gen-sysreg.awk $kerneldir/build/   2>/dev/null || :
        cp -a --parents arch/arm64/tools/sysreg $kerneldir/build/   2>/dev/null || :

        if [ -e $kerneldir/build/arch/arm64/tools/gen-sysreg.awk ]; then
            sed -i -e "s,#!.*awk.*,#!${USRBINPATH}/env awk," $kerneldir/build/arch/arm64/tools/gen-sysreg.awk
        fi

        chown -R root:root $kerneldir/build/arch/arm64/tools/
        )
    fi

    if [ "${ARCH}" = "arm" ]; then
        (
        cd ${S}
        cp -a --parents arch/arm/tools/gen-sysreg.awk $kerneldir/build/	2>/dev/null || :

        chown -R root:root $kerneldir/build/arch/arm/tools/
        )
    fi
    ######################################################################################################

    mv $kerneldir/build $kerneldir/linux
    tar cjfv ${D}/usr/src/linux.tar.bz2 -C $kerneldir linux
    rm -rf ${D}/usr/lib ${D}/usr/src/kernel
}

FILES:${PN} += "/usr/src/linux.tar.bz2"

RDEPENDS:${PN}:remove = "bc python3 flex bison glibc-utils openssl-dev util-linux gcc-plugins libmpc-dev"
