
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://debug.cfg \
    file://${MACHINE}.cfg \
"

do_configure:append() {
    # machine fragment
    if [ -f ${WORKDIR}/${MACHINE}.cfg ]; then
        cat ${WORKDIR}/${MACHINE}.cfg >> ${B}/.config
    else
        bbfatal "No machine specific config fragment found for ${MACHINE}"
    fi

    # debug fragment
    if [ "${TDX_DEBUG}" = "1" ]; then
        cat ${WORKDIR}/debug.cfg >> ${B}/.config
    fi
}
