#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/oppo/CPH1911

# Assert
TARGET_OTA_ASSERT_DEVICE := CPH1911

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# tzdata
PRODUCT_PACKAGES_ENG += \
    tzdata_twrp

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# Keystore2
#PRODUCT_PACKAGES += \
#    android.system.keystore2

# health Hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
