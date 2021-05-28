IMAGE_INSTALL = "packagegroup-core-boot \
                 ${CORE_IMAGE_EXTRA_INSTALL} \
                 kernel-modules \
                 python3 python3-dev \
                 libffi libffi-dev \
                 openssl openssl-dev \
                 libxml2 libxml2-dev \
                 libxslt libxslt-dev \
                 zlib zlib-dev \
                 python3-ryu python3-ryu-dev \
                 "

IMAGE_LINGUAS = " "

LICENSE = "MIT"

VIRTUAL-RUNTIME_init_manager = "sysvinit"
VIRTUAL-RUNTIME_initscripts = "initscripts"

inherit core-image

IMAGE_ROOTFS_SIZE ?= "8192"
