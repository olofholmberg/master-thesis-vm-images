#
# Copyright 2021, Mattias Waldo
#
# SPDX-License-Identifier: GPL-2.0-only
#

PACKETS="$*"
docker run --rm -it -v $PWD/work:/home/yoctouser/work sel4_vm_build /bin/bash -c "source /home/yoctouser/work/oe-init-build-env && bitbake -c cleanall $PACKETS"
