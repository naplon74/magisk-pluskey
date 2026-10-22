<div align="center">

<img width="128" height="128" alt="pluskey-icon" src="https://github.com/user-attachments/assets/17f3d404-f86d-4942-8d07-90f4018b94c9" />

# Magisk - Plus Key



<p>
  <img width="250" alt="Screenshot From 2026-10-22 12-56-25" src="https://github.com/user-attachments/assets/b086e5ef-088e-4f8e-87bb-2ba17b9cc998" />
  <img width="250" alt="Screenshot From 2026-10-22 12-56-32" src="https://github.com/user-attachments/assets/6ab6f51b-f158-4594-9137-6417a2a3734e" />
  <img width="250" alt="Screenshot From 2026-10-22 12-56-41" src="https://github.com/user-attachments/assets/85c5083a-8f8c-4ba5-95a8-b89e35ee81b8" />
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

| ROM / Devices |       **Nord 5**      | **13a** | **15** | **15R** | **Oppo Devices** |
|:-------------:|:---------------------:|:-------:|:------:|:-------:|:-------:|
|   OxygenOS 16 | - | - | - | - | - |
|   OxygenOS 15 | - | - | - | - | - |
|    crDroid    | ✅ [(12.12 Android 16)](https://crdroid.net/lexus/12) | - | - | - | - |
|   LineageOS   |  ✅ [(23.2 Android 16)](https://wiki.lineageos.org/devices/lexus/) | - | - | - | - |
|   AlphaDroid  | ✅ [(4.7 Android 16](https://alphadroid.org/#devices) | - | - | - | - |
|   DerpFest    | ✅ [16.2 Android 16](https://derpfest.org/devices?s=lexus) | - | - | - | - |


Other phones and ROMs are untested. The module expects the Plus Key to report `BTN_TRIGGER_HAPPY32` and the key layout to be at `/vendor/usr/keylayout/gpio-keys.kl`.

>[!NOTE]
> I have no idea if this module would work on Oppo devices? If you any Oppo devices / OnePlus with the plus key let me know (naplon_ on discord).

## How it works

A systemless overlay removes the stock mapping for the key. A small root service listens for the key press and runs the action you chose.

## Build from source

Module (needs `zip`):

    ./build.sh

This writes `pluskey-<version>.zip` in the repo root.

## Credits

Made by naplon74. Requires Magisk by topjohnwu.
