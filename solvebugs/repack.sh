#!/bin/sh
cd /tmp/work
magiskboot repack recovery.img newRec.img

#To solve theme bug and passwd bug because the phone unlock bootloader
rename newRec.img recovery.img
mount -o rw /system
PK8="/sdcard/SHRP/addons/supersu.pk8"
X509="/sdcard/SHRP/addons/supersu.x509.der"
BOOTSIGNATURE="/system/bin/dalvikvm -Xbootclasspath:/system/framework/core-oj.jar:/system/framework/core-libart.jar:/system/framework/conscrypt.jar:/system/framework/bouncycastle.jar -Xnodex2oat -Xnoimage-dex2oat -cp /sdcard/SHRP/addons/BootSignature_Android.jar com.android.verity.BootSignature"
unset LD_LIBRARY_PATH
$BOOTSIGNATURE /recovery recovery.img $PK8 $X509 newRec.img
umount /system
