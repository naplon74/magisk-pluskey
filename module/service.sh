#!/system/bin/sh
MODDIR=${0%/*}
until [ "$(getprop sys.boot_completed)" = "1" ]; do sleep 2; done
mkdir -p /data/adb/pluskey
sh "$MODDIR/pluskey.sh" &
