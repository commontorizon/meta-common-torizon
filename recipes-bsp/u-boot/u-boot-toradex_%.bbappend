FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI = "git://github.com/microhobby/u-boot-toradex.git;protocol=https;branch=${SRCBRANCH}"

SRC_URI:append = " \
    file://bootcommand.cfg \
    file://bootcount.cfg \
    file://bootlimit.cfg \
    file://debug.cfg \
"

do_configure:append() {
    # debug fragment
    if [ "${TDX_DEBUG}" = "1" ]; then
        cat ${WORKDIR}/debug.cfg >> ${B}/.config
    fi
}

require u-boot-ota.inc
