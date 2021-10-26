#
# Copyright 2021, Mattias Waldo
#
# SPDX-License-Identifier: GPL-2.0-only
#

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://config.cfg \
           "

INITRAMFS_IMAGE = "vm-initramfs"
