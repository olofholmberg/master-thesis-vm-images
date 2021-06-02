#!/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin

fatal() {
    echo $1 >/dev/console
    echo >/dev/console
    exec setsid sh -c "exec sh <> /dev/$ACTIVE_CONSOLE >&0 2>&1"
}

echo "**************"
echo "Initramfs init"
echo "**************"

# Mount system folders
mkdir -p /proc /sys /run/lock /var/lock /var/run
mount -t proc proc /proc
mount -t sysfs sysfs /sys
mount -t devtmpfs none /dev

# Start udev
/sbin/udevd --daemon
udevadm trigger --action=add
udevadm settle --timeout=3

# Find the current console
ACTIVE_CONSOLE=`cat /sys/devices/virtual/tty/console/active`
[ -z "$CONSOLE" ] && CONSOLE="/dev/console"

# Read args
CMDLINE=`cat /proc/cmdline`
for arg in $CMDLINE; do
    optarg=`expr "x$arg" : 'x[^=]*=\(.*\)'`
    case $arg in
        root=*)
        ROOT_DEVICE=$optarg ;;
    esac
done

# Pivot to new/real root...
# ...mount the device where the rootfs resides
NEWROOT="/rootfs"
mkdir $NEWROOT

# ...move system mounts
mount -n --move /proc $NEWROOT/proc
mount -n --move /sys $NEWROOT/sys
mount -n --move /dev $NEWROOT/dev

# ...kill udev
udevadm control -e
# ...and switch root
echo "**************"
echo "Rootfs init   "
echo "**************"
exec switch_root -c /dev/console $NEWROOT /sbin/init $CMDLINE ||
    fatal "Couldn't switch_root, dropping to shell"
