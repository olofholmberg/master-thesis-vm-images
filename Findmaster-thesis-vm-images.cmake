#
# Copyright 2021, Olof Holmberg
#
# SPDX-License-Identifier: GPL-2.0-only
#

set(MASTER_THESIS_VM_IMAGES_DIR "${CMAKE_CURRENT_LIST_DIR}" CACHE STRING "")
mark_as_advanced(MASTER_THESIS_VM_IMAGES_DIR)

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(master-thesis-vm-images DEFAULT_MSG MASTER_THESIS_VM_IMAGES_DIR)
