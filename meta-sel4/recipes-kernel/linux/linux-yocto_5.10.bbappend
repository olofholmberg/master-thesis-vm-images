FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://config.cfg \
           "

INITRAMFS_IMAGE = "vm-initramfs"