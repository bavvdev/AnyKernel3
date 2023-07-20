# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string= - DOW, DAY MONTH YEAR
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=citrus
device.name2=lime
device.name3=lemon
device.name4=pomelo
device.name5=juice
device.name6=chime
supported.versions=
supported.patchlevels=
'; } # end properties

# AnyKernel install
# begin attributes
attributes() {
    set_perm_recursive 0 0 755 644 $ramdisk/*;
    set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
} # end attributes

## shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

### AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel boot install
dump_boot;

# Remove ramdisk overlay if any
if [ -d \$ramdisk/overlay ]; then
    rm -rf \$ramdisk/overlay;
fi;

write_boot;
## end boot install
