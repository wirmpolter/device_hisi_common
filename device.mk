#
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2018 The OpenKirin Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, vendor/huawei/mha/mha-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-aosip \

# Device init scripts
PRODUCT_PACKAGES += \
    init.hi3660.rc \
    init.hi3660.environ.rc

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Display
PRODUCT_PACKAGES += \
    libion

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/compatibility_matrix.xml:system/compatibility_matrix.xml

PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fingerprint.kl:system/usr/keylayout/fingerprint.kl

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    Tag

PRODUCT_PACKAGES += \
    NfcNci \
    nfc_nci.pn54x.default

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/prebuilt/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Properties
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
    ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
    ro.build.version.huawei=8.0.0 \
    ro.build.version.release=$(PLATFORM_VERSION) \
    ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
    ro.cust.cdrom=/dev/null

# GPS
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
  $(LOCAL_PATH)/configs/gps.conf:system/etc/gps_debug.conf

# Release tools
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/releasetools/releasetools.hi3660.sh:system/bin/releasetools.hi3660.sh

# Radio
PRODUCT_PACKAGES += \
    qti-telephony-common

PRODUCT_BOOT_JARS += \
    telephony-ext

# TextClassifier smart selection model files
PRODUCT_PACKAGES += \
    textclassifier.smartselection.bundle1

# Sdcardfs
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.sys.sdcardfs=0 \
    persist.sys.sdcardfs.emulated=0 \
    persist.sys.sdcardfs.public=0

# Shims
PRODUCT_PACKAGES += \
    libshims_hisupl

# VNDK
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vndk-compat/ld.config.compat.txt:system/etc/ld.config.compat.txt \
    $(LOCAL_PATH)/vndk-compat/vndk-compat.rc:system/etc/init/vndk-compat.rc
