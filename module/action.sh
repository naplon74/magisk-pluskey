#!/system/bin/sh
# Magisk "Action" button: cycles to the next preset.
MODDIR=${0%/*}
CONF=${PLUSKEY_CONF:-/data/adb/pluskey}
mkdir -p "$CONF"
cur=$(cat "$CONF/choice" 2>/dev/null); [ -z "$cur" ] && cur=assistant
first=""; next=""; take=0
for p in $(ls "$MODDIR/preset" | sed 's/\.sh$//'); do
  [ -z "$first" ] && first=$p
  if [ "$take" = 1 ]; then next=$p; take=0; fi
  [ "$p" = "$cur" ] && take=1
done
[ -z "$next" ] && next=$first
echo "$next" > "$CONF/choice"
echo "Plus Key action: $next"
