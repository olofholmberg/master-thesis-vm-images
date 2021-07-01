docker run --rm -it -v $PWD/work:/home/yoctouser/work sel4_vm_build /bin/bash -c "source /home/yoctouser/work/oe-init-build-env && bitbake -c cleanall $@"
