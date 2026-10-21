<div align="center">

<img width="128" height="128" alt="pluskey-icon" src="https://github.com/user-attachments/assets/17f3d404-f86d-4942-8d07-90f4018b94c9" />

# Magisk - Plus Key



<p>
  <img src="https://github.com/user-attachments/assets/d038a627-52b2-4eb4-bc0a-bb2c88fd3650" width="240" alt="Actions tab">
  <img src="https://github.com/user-attachments/assets/4653aa92-0d76-4913-9808-4114a09a7822" width="240" alt="Info tab">
</p>

A Magisk module that lets you choose what the Plus Key does. Pick a preset (assistant, camera, screenshot, flashlight) or run your own shell command.

</div>

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


## Tested on (WITH MAGISK ROOT)

| ROM / Devices |       **Nord 5**      | **13a** | **15** | **15R** |
|:-------------:|:---------------------:|:-------:|:------:|:-------:|
|    crDroid    | ✅ [(12.12 Android 16)](https://crdroid.net/lexus/12) |    -    |    -   |    -    |
|   LineageOS   |  ✅ [(23.2 Android 16)](https://wiki.lineageos.org/devices/lexus/) |    -    |    -   |    -    |
|   AlphaDroid  | In test |    -    |    -   |    -    |
|   DerpFest    | In test | - | - | - |


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
