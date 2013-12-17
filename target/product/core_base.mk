#
# Copyright (C) 2013 The Android Open Source Project
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
# Note that components added here will be also shared in PDK. Components
# that should not be in PDK should be added in lower level like core.mk.
#
# This file was modified by Dolby Laboratories, Inc. The portions of the
# code that are surrounded by "DOLBY..." are copyrighted and
# licensed separately, as follows:
#
#  (C) 2011-2013 Dolby Laboratories, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_PROPERTY_OVERRIDES := \
    ro.config.notification_sound=OnTheHunt.ogg \
    ro.config.alarm_alert=Alarm_Classic.ogg

PRODUCT_PACKAGES += \
    ContactsProvider \
    DefaultContainerService \
    Home \
    TelephonyProvider \
    UserDictionaryProvider \
    atrace \
    libandroidfw \
    libaudiopreprocessing \
    libaudioutils \
    libbcc \
    libfilterpack_imageproc \
    libgabi++ \
    libkeystore \
    libmdnssd \
    libnfc_ndef \
    libportable \
    libpowermanager \
    libspeexresampler \
    libstagefright_chromium_http \
    libstagefright_soft_aacdec \
    libstagefright_soft_aacenc \
    libstagefright_soft_amrdec \
    libstagefright_soft_amrnbenc \
    libstagefright_soft_amrwbenc \
    libstagefright_soft_flacenc \
    libstagefright_soft_g711dec \
    libstagefright_soft_gsmdec \
    libstagefright_soft_h264dec \
    libstagefright_soft_h264enc \
    libstagefright_soft_mp3dec \
    libstagefright_soft_mpeg4dec \
    libstagefright_soft_mpeg4enc \
    libstagefright_soft_rawdec \
    libstagefright_soft_vorbisdec \
    libstagefright_soft_vpxdec \
    libstagefright_soft_vpxenc \
    libvariablespeed \
    libwebrtc_audio_preprocessing \
    libwebrtc_audio_coding \
    mdnsd \
    mms-common \
    requestsync \
    screenrecord \
    telephony-common \
    voip-common \
    telephony-msim
ifdef DOLBY_DAP
    PRODUCT_PACKAGES += \
        Ds \
        dolby_ds
    ifdef DOLBY_DAP_NOCONSUMERAPP
    else
        PRODUCT_PACKAGES += \
            DsUI
    endif
    ifdef DOLBY_DAP_OPENSLES
        PRODUCT_PACKAGES += \
            libdseffect
    else ifdef DOLBY_DAP_DSP
        PRODUCT_PACKAGES += \
            libds_jni \
            libds_native
    endif
endif #DOLBY_DAP
ifdef DOLBY_UDC
    PRODUCT_PACKAGES += \
        libstagefright_soft_ddpdec
endif #DOLBY_UDC

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)
# Override the PRODUCT_BOOT_JARS set in core_minimal.mk
ifdef DOLBY_DAP
PRODUCT_BOOT_JARS := core:conscrypt:okhttp:core-junit:bouncycastle:ext:framework:framework2:telephony-common:voip-common:mms-common:android.policy:services:apache-xml:webviewchromium:telephony-msim:dolby_ds
else  # DOLBY_END
PRODUCT_BOOT_JARS := core:conscrypt:okhttp:core-junit:bouncycastle:ext:framework:framework2:telephony-common:voip-common:mms-common:android.policy:services:apache-xml:webviewchromium:telephony-msim
endif # LINE_ADDED_BY_DOLBY
