#!/bin/bash

WORK_DIR="$(mktemp -d)"

cd "$(dirname "$0")"

KERNEL_VER=aufs_friendly
SYSLINUX_MODULES="chain.c32 cmd.c32 isolinux.bin reboot.c32 vesamenu.c32 whichsys.c32"

cp -a boot "$WORK_DIR/boot"
cp -a /boot/memtest86+/memtest.bin "$WORK_DIR/boot/"
for MOD in $SYSLINUX_MODULES; do
    cp -a "/usr/lib/syslinux/$MOD" "$WORK_DIR/boot/syslinux/"
done
cp -a "/usr/lib/syslinux/pxelinux.0" "$WORK_DIR/boot/"
cp -a "/boot/vmlinuz-linux-$KERNEL_VER" "$WORK_DIR/boot/vmlinuz"
cp -a "/boot/oi_boot-$KERNEL_VER.img" "$WORK_DIR/boot/oi_boot.img"

( cd "$WORK_DIR"; tar cf oi-boot.tar boot )

echo "Boot tarball ready: $WORK_DIR/oi-boot.tar"
