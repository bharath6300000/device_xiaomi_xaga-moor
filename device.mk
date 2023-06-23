#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from mt6895-common
$(call inherit-product, device/xiaomi/mt6895-common/mt6895-common.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/xaga/xaga-vendor.mk)

#Debug info
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_SYSTEM_SERVER_DEBUG_INFO := false
WITH_DEXPREOPT_DEBUG_INFO := false

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Dolby
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-com.dolby.daxappui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-com.dolby.daxappui.xml \
    $(LOCAL_PATH)/configs/permissions/privapp-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-com.dolby.daxservice.xml \
    $(LOCAL_PATH)/configs/sysconfig/config-com.dolby.daxappui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/config-com.dolby.daxappui.xml \
    $(LOCAL_PATH)/configs/sysconfig/config-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/config-com.dolby.daxservice.xml \
    $(LOCAL_PATH)/configs/sysconfig/hiddenapi-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/hiddenapi-com.dolby.daxservice.xml

# FM Radio
PRODUCT_PACKAGES += \
    MtkFMRadio

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-fpc.idc \
    $(LOCAL_PATH)/configs/idc/uinput-goodix.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-goodix.idc \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl
    
# MIUI Camera
# PRODUCT_SYSTEM_PROPERTIES += \
   # ro.miui.notch=1 \
   # ro.product.mod_device=xaga_global \
   # camera.lab.options=true

# Overlays
PRODUCT_PACKAGES += \
    FrameworkResOverlay \
    XagaProFrameworkResOverlay \
    SystemUIOverlay \
    XagaProInFrameworkResOverlay \
    SettingsOverlay

PRODUCT_PACKAGES += \
    AOSPSettingsOverlay

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/modules/modules.load.recovery:recovery/root/lib/modules/modules.load.recovery

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/prebuilts/firmware/,recovery/root/vendor/firmware)

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# Rootdir
PRODUCT_PACKAGES += \
    init.project.rc \
    meta_init.rc

# Xiaomi Parts
PRODUCT_PACKAGES += \
    XiaomiParts \
    gpu_optimizer.rc
