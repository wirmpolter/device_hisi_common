#!/sbin/sh
#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Remount system as R/W
mount -o rw,remount /system

# Remove duplicated genfscon rules
sed -i "/genfscon exfat/d" /system/etc/selinux/plat_sepolicy.cil
sed -i "/genfscon fuseblk/d" /system/etc/selinux/plat_sepolicy.cil

# 8.0 vendor image specific hacks
if [ "$(grep ro.build.version.release /vendor/build.prop)" = "ro.build.version.release=8.0.0" ]; then
    # Fix logd service definition
    sed -i "s/socket logdw dgram+passcred 0222 logd logd/socket logdw dgram 0222 logd logd/g" /system/etc/init/logd.rc

    # Add type and mapping for displayengine-hal-1.0
    echo "(typeattributeset hwservice_manager_type (displayengine_hwservice))" >> /system/etc/selinux/plat_sepolicy.cil
    echo "(type displayengine_hwservice)" >> /system/etc/selinux/plat_sepolicy.cil
    echo "(roletype object_r displayengine_hwservice)" >> /system/etc/selinux/plat_sepolicy.cil
    echo "(typeattributeset displayengine_hwservice_26_0 (displayengine_hwservice))" >> /system/etc/selinux/mapping/26.0.cil

    # Copy over vendor media_codecs.xml and disable unwanted HW codecs
    cp /vendor/etc/media_codecs.xml /system/etc/media_codecs.xml
    sed -i "s/<MediaCodec name=\"OMX.hisi.video.decoder.avc\" type=\"video\/avc\" >/<MediaCodec name=\"OMX.hisi.video.decoder.avc\" type=\"video\/no-avc\" >/g" /system/etc/media_codecs.xml

    # Disable parsing intra-refresh-mode parameter in libstagefright
    sed -i 's/intra-refresh-mode/intra-refresh-nope/' /system/lib64/libstagefright.so
    sed -i 's/intra-refresh-mode/intra-refresh-nope/' /system/lib/libstagefright.so
fi

exit 0
