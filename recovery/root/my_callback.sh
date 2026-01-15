#!/bin/bash

# Use a relative path from the root of your OrangeFox source
# DO NOT put a "/" at the start if it's inside your project folder
SOURCE_IMAGE="device/oppo/CPH1989/addon/maintainer.png"

# Target location in the recovery ramdisk
TARGET_DIR="$FOX_RAMDISK/twres/images/Default/About"

if [ -f "$SOURCE_IMAGE" ]; then
    echo "Applying custom maintainer image from device tree..."
    mkdir -p "$TARGET_DIR"
    cp -f "$SOURCE_IMAGE" "$TARGET_DIR/maintainer.png"
    echo "Success: maintainer.png updated."
else
    echo "Error: Image not found at $SOURCE_IMAGE"
    # Tip: check if you are running 'lunch' from the base of the source tree
    exit 1
fi
