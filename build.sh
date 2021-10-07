export DOCKER_BUILDKIT=1
docker build -t sel4_vm_build .

cd "${0%/*}"
OWN_DIR=$(pwd)

# Clone repo and init build env
git clone -b yocto-3.3 git://git.yoctoproject.org/poky work/                        2>/dev/null
git -C work clone -b hardknott git://git.yoctoproject.org/meta-cloud-services       2>/dev/null
git -C work/meta-cloud-services checkout d33dd7566e3d5e28d250354bbbee9af7350734f9
git -C work clone -b hardknott git://git.openembedded.org/meta-openembedded         2>/dev/null
git -C work/meta-openembedded checkout aca88908fd329f5cef6f19995b072397fb2d8ec6
git -C work clone -b hardknott git://git.yoctoproject.org/meta-virtualization       2>/dev/null
git -C work/meta-virtualization checkout 3508b13acbf669a5169fafca232a5c4ee705dd16
cd work
. oe-init-build-env

# Copy own layers and config
cd $OWN_DIR
rm -rf work/meta-sel4
cp -r meta-sel4/ work/
cp conf/bblayers.conf work/build/conf/
cp conf/local.conf work/build/conf/

docker run --rm -it -v $PWD/work:/home/yoctouser/work sel4_vm_build /bin/bash -c "source /home/yoctouser/work/oe-init-build-env && bitbake vm"
