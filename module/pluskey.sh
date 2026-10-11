#!/system/bin/sh
# Listens for the Plus Key (BTN_TRIGGER_HAPPY32) and runs the action chosen in /data/adb/pluskey/choice
MODDIR=${0%/*}
KEY=BTN_TRIGGER_HAPPY32
CONF=/data/adb/pluskey
LOG=/data/local/tmp/pluskey.log

run_action() {
  CHOICE=$(cat "$CONF/choice" 2>/dev/null)
  case "$CHOICE" in
    *[!a-z0-9_-]*|"") CHOICE=assistant ;;
  esac
  if [ "$CHOICE" = "custom" ] && [ -f "$CONF/custom.sh" ]; then
    sh "$CONF/custom.sh"
  elif [ -f "$MODDIR/preset/$CHOICE.sh" ]; then
    sh "$MODDIR/preset/$CHOICE.sh"
  else
    sh "$MODDIR/preset/assistant.sh"
  fi
}

# find the input device that actually has the Plus Key (event numbers can change)
DEV=""
for d in /dev/input/event*; do
  if getevent -lp "$d" 2>/dev/null | grep -q "$KEY"; then
    DEV=$d
    break
  fi
done

if [ -z "$DEV" ]; then
  echo "$(date) no input device exposes $KEY, exiting" >> "$LOG"
  exit 1
fi
echo "$(date) listening on $DEV for $KEY" >> "$LOG"

# With a device path, getevent -l prints "EV_KEY BTN_... DOWN" (no /dev/input/eventN: prefix),
# so match on the whole line instead of counting fields.
getevent -l "$DEV" | while read -r line; do
  case "$line" in
    *"$KEY"*DOWN*)
      echo "$(date) press (choice: $(cat "$CONF/choice" 2>/dev/null))" >> "$LOG"
      run_action >> "$LOG" 2>&1 &
      ;;
  esac
done
