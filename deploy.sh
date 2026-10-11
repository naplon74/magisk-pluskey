#!/bin/bash
# Push module/ to the phone and restart the listener. Overlay (.kl) changes still need a reboot.
set -e
adb shell "rm -rf /data/local/tmp/pluskey_stage"
adb push module/. /data/local/tmp/pluskey_stage/
adb shell "su -c 'mkdir -p /data/adb/modules/pluskey && cp -r /data/local/tmp/pluskey_stage/. /data/adb/modules/pluskey/ && chmod -R 755 /data/adb/modules/pluskey && pkill getevent; pkill -f pluskey.sh; nohup sh /data/adb/modules/pluskey/service.sh >/dev/null 2>&1 &'"
