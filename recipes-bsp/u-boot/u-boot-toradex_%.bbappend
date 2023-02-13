FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI = "git://github.com/microhobby/u-boot-toradex.git;protocol=https;branch=${SRCBRANCH}"

SRC_URI:append = " \
    file://bootcommand.cfg \
    file://bootcount.cfg \
    file://bootlimit.cfg \
"

require u-boot-ota.inc
