SUMMARY = "seL4 master thesis initramfs"

IMAGE_INSTALL = "kernel-modules initramfs-init ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"

# Do not pollute the initrd image with rootfs features
IMAGE_FEATURES = ""

export IMAGE_BASENAME = "${MLPREFIX}vm-initramfs"
IMAGE_LINGUAS = ""

LICENSE = "MIT"

IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
inherit core-image

IMAGE_ROOTFS_SIZE = "8192"
IMAGE_ROOTFS_EXTRA_SPACE = "0"

INITRAMFS_FSTYPES = "cpio.gz"

# Remove the kernel image from inside the root fs bundled inside the kernel image...
rootfs_rm_bzimage () {
    rm -f ${IMAGE_ROOTFS}/boot/bzImage*
}

ROOTFS_POSTPROCESS_COMMAND += "rootfs_rm_bzimage;"