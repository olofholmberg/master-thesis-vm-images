SUMMARY = "Scripts for initializing an initramfs and pivoting to a root filesystem."
LICENSE = "CLOSED"

RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils} udev-extraconf "

SRC_URI = "file://init.sh \
          "

FILES_${PN} = "/init /dev"

do_install() {
    # Create device nodes expected by some kernels in initramfs
    # before even executing /init.
    install -d ${D}/dev
    mknod -m 622 ${D}/dev/console c 5 1

    # Init scripts
    install -m 0755 ${WORKDIR}/init.sh ${D}/init

}