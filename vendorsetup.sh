
FDEVICE="CPH1911"

fox_get_target_device() {
local chkdev
  if echo "$BASH_SOURCE" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif set | grep BASH_ARGV | grep -w \"$FDEVICE\"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif echo "${BASH_SOURCE[0]}" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif echo "$0" | grep -q "$FDEVICE"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  fi
}

if [ -z "$FOX_BUILD_DEVICE" ]; then
	fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

# Flashlight
export OF_FLASHLIGHT_ENABLE="1"
export OF_FL_PATH1="/system/flashlight"
export OF_USE_GREEN_LED="0"

export OF_NO_TREBLE_COMPATIBILITY_CHECK=1

# no special MIUI/Samsung stuff
#export OF_DISABLE_MIUI_SPECIFIC_FEATURES="1"
#export OF_NO_MIUI_PATCH_WARNING=1
#export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1
#export OF_DISABLE_MIUI_OTA_BY_DEFAULT="1"
export FOX_VANILLA_BUILD="1" #this var enables all above

export FOX_ENABLE_APP_MANAGER="1"
export OF_ALLOW_DISABLE_NAVBAR="0"
export OF_USE_LEGACY_BATTERY_SERVICES="1"
#export FOX_USE_NANO_EDITOR="1"
#export FOX_USE_XZ_UTILS="1"
export FOX_REMOVE_AAPT="1"
export FOX_DRASTIC_SIZE_REDUCTION="1"

# for oppo/realme ozip decryption
export OF_SUPPORT_OZIP_DECRYPTION=1

export OF_DONT_KEEP_LOG_HISTORY="1"
export OF_FBE_METADATA_MOUNT_IGNORE="1"

# about
export OF_MAINTAINER="Omar"
export FOX_BUILD_TYPE="Unofficial"
export FOX_TARGET_DEVICES="CPH1911,OP4863,CPH1969,CPH1913"
export TARGET_DEVICE_ALT="OP4863, CPH1911, CPH1969, CPH1913"
#export FOX_MAINTAINER_PATCH_VERSION="04"
export FOX_VARIANT="Unified"

#f11 notch
export OF_HIDE_NOTCH="1"
export OF_STATUS_H="77"
export OF_CLOCK_POS="1"

export OF_SCREEN_H="2340"
export OF_STATUS_INDENT_LEFT=75
export OF_STATUS_INDENT_RIGHT=75
export FOX_SETTINGS_ROOT_DIRECTORY="/persist/OFRP"
export FOX_MISCELLANEOUS_ROOT_DIRECTORY="/data/media/OFRP"
export OF_QUICK_BACKUP_LIST="/boot;/data;"
export OF_DEFAULT_TIMEZONE="WET-2"
export FOX_LOCAL_CALLBACK_SCRIPT="device/oppo/CPH1911/recovery/root/my_callback.sh"
export OF_ADVANCED_SECURITY=1
export FOX_ALLOW_EARLY_SETTINGS_LOAD="1"

# Magisk
function download_magisk(){
    # Usage: download_magisk <destination_path>
    local DEST=$1
    if [ -n "${DEST}" ]; then
      if [ ! -e ${DEST} ]; then
        echo "Downloading Magisk Version 30.6..."
        local MAGISK_V27_URL="https://github.com/topjohnwu/Magisk/releases/download/v30.6/Magisk-v30.6.apk"
        mkdir -p $(dirname ${DEST})
        wget -q ${MAGISK_V27_URL} -O ${DEST} || wget ${MAGISK_V27_URL} -O ${DEST}
        local RCODE=$?
        if [ "$RCODE" = "0" ]; then
          echo "Successfully Downloaded Magisk v27.0 to ${DEST}!"
          echo "Done!"
        else
          echo "Failed to Download Magisk v27.0 to ${DEST}!"
        fi
      fi
    fi
}
export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk.zip
download_magisk $FOX_USE_SPECIFIC_MAGISK_ZIP

fi

#"OF_NO_RELOAD_AFTER_DECRYPTION"
#OF_SKIP_FBE_DECRYPTION_SDKVERSION=34
#OF_SPLASH_MAX_SIZE
