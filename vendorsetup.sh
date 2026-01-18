# Flashlight
export OF_FLASHLIGHT_ENABLE="1"
export OF_FL_PATH1="/system/flashlight"
export OF_USE_GREEN_LED="0"

export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_DONT_PATCH_ON_FRESH_INSTALLATION="0"

# no special MIUI/Samsung stuff
export OF_DISABLE_MIUI_SPECIFIC_FEATURES="1"
export OF_NO_MIUI_PATCH_WARNING=1
export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1
export OF_DISABLE_MIUI_OTA_BY_DEFAULT="1"
export FOX_NO_SAMSUNG_SPECIAL="1"

export FOX_DISABLE_APP_MANAGER="0"
export FOX_ENABLE_APP_MANAGER="1"
export OF_ALLOW_DISABLE_NAVBAR="0"
export OF_USE_LEGACY_BATTERY_SERVICES="1"
export FOX_EXCLUDE_NANO_EDITOR="0"
export FOX_USE_NANO_EDITOR="1"
export FOX_REMOVE_AAPT="0"
export FOX_USE_XZ_UTILS="1"
export FOX_USE_SED_BINARY="0"
export FOX_USE_GREP_BINARY="0"

# for oppo/realme ozip decryption
export OF_SUPPORT_OZIP_DECRYPTION=1
export TW_OZIP_DECRYPT_KEY="ACAC1E13A72431AEUA1B22BBA1C1C6A2"

export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER="1"
export OF_USE_TWRP_SAR_DETECT="1"
export OF_USE_MAGISKBOOT="1"
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"
export OF_DONT_KEEP_LOG_HISTORY="0"
export OF_FBE_METADATA_MOUNT_IGNORE="1"
export FOX_INSTALLER_DISABLE_AUTOREBOOT="0"

# about
export OF_MAINTAINER="Omar"
export FOX_BUILD_TYPE="Unofficial"
FOX_TARGET_DEVICES="CPH1911,OP4863,CPH1969,CPH1913"
export TARGET_DEVICE_ALT="OP4863, CPH1911, CPH1969, CPH1913"
#export FOX_MAINTAINER_PATCH_VERSION="R11.1"
export FOX_VARIANT="Unified"

#f11 notch
export OF_HIDE_NOTCH="1"
export OF_STATUS_H="144"
#export OF_CLOCK_POS="1"

export OF_SCREEN_H="2340"
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48
#export OF_DEFAULT_KEYMASTER_VERSION="3.0"
export FOX_SETTINGS_ROOT_DIRECTORY="/persist/OFRP"
export FOX_MISCELLANEOUS_ROOT_DIRECTORY="/data/media/OFRP"
export OF_QUICK_BACKUP_LIST="/boot;/data;"
export OF_DEFAULT_TIMEZONE="WET-2"
export FOX_LOCAL_CALLBACK_SCRIPT="device/oppo/CPH1911/recovery/root/my_callback.sh"
#export OF_FIX_DECRYPTION_ON_DATA_MEDIA="1"

export OF_ADVANCED_SECURITY=1
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

#"OF_NO_RELOAD_AFTER_DECRYPTION"
#OF_SKIP_FBE_DECRYPTION_SDKVERSION=31
#OF_SPLASH_MAX_SIZE
