SRCREV_meta = "28e4bed443b7fda1bfbd028abf38f655397b6268"
SRCREV_meta:use-head-next = "${AUTOREV}"

KMETABRANCH = "kirkstone-6.x.y"
KMETA = "kernel-meta"

KMETAREPOSITORY="github.com/toradex/toradex-kernel-cache.git"
KMETAPROTOCOL="https"

SRC_URI += "git://${KMETAREPOSITORY};protocol=${KMETAPROTOCOL};type=kmeta;name=meta;branch=${KMETABRANCH};destsuffix=${KMETA}"
