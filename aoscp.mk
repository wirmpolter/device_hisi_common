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

$(call inherit-product, $(LOCAL_PATH)/pre-base.mk)
$(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
$(call inherit-product, $(LOCAL_PATH)/full_mha.mk)

# Inherit some common CypherOS stuff.
$(call inherit-product, vendor/aoscp/configs/common_full_phone.mk)

RR_BUILDTYPE = OpenKirin

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

PRODUCT_NAME := aoscp_mha
PRODUCT_DEVICE := mha
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := Mate-9

PRODUCT_GMS_CLIENTID_BASE := android-huawei

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=hi3660
