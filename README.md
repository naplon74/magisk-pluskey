# magisk-pluskey

A Magisk module that lets you choose what the Plus Key does. Pick a preset (assistant, camera, screenshot, flashlight) or run your own shell command.

## Install

1. Download the latest `pluskey.zip` from the [Releases](https://github.com/naplon74/magisk-pluskey/releases) page.
2. In the Magisk app, go to Modules > Install from storage and pick the zip.
3. Reboot.

That's all you need. The key works with the default action (assistant) right after the reboot.

You need a rooted phone with Magisk.

## Choosing what the key does

Use the companion app (see below), or run this from a root shell:

    pluskey list
    pluskey set camera
    pluskey custom 'am start -a android.settings.SETTINGS'

The change applies on the next key press, no reboot needed.

## Companion app

There is a small app in `app/` with a settings screen and a Quick Settings tile. It only runs the `pluskey` command above, so the module works fine without it. Build it from source (see below) and install the APK.


## Tested on

- OnePlus Nord 5 (CPH2709)
- crDroid, Android 16
- Magisk

Other phones and ROMs are untested. The module expects the Plus Key to report `BTN_TRIGGER_HAPPY32` and the key layout to be at `/vendor/usr/keylayout/gpio-keys.kl`.

## How it works

A systemless overlay removes the stock mapping for the key. A small root service listens for the key press and runs the action you chose.

## Build from source

Module (needs `zip`):

    ./build.sh

This writes `pluskey-<version>.zip` in the repo root.

App (needs JDK 17 or 21 and the Android SDK):

    cd app
    ./gradlew assembleDebug
    adb install -r app/build/outputs/apk/debug/app-debug.apk

## Credits

Made by naplon74. Requires Magisk by topjohnwu.