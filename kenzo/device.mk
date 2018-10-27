#
# Copyright (C) 2016 The CyanogenMod Project
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

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# call the proprietary setup
$(call inherit-product-if-exists, vendor/xiaomi/kenzo/kenzo-vendor.mk)

# Device-specific permissions
PRODUCT_COPY_FILES += $(foreach permission, $(wildcard $(LOCAL_PATH)/configs/permissions/*), \
    $(permission):$(addprefix $(TARGET_COPY_OUT_VENDOR)/etc/permissions/, $(notdir $(permission))) )

# Cellular data configuration files
PRODUCT_COPY_FILES += $(foreach data_config, $(wildcard $(LOCAL_PATH)/configs/data/*), \
    $(data_config):$(addprefix $(TARGET_COPY_OUT_VENDOR)/etc/data/, $(notdir $(data_config))) )

# Device-specific audio configs
PRODUCT_COPY_FILES += $(foreach audio_config, $(wildcard $(LOCAL_PATH)/configs/audio/*), \
    $(audio_config):$(addprefix $(TARGET_COPY_OUT_VENDOR)/etc/, $(notdir $(audio_config))) )

# Input configs
PRODUCT_COPY_FILES += $(foreach input_config, $(wildcard $(LOCAL_PATH)/configs/idc/*), \
    $(input_config):$(addprefix $(TARGET_COPY_OUT_SYSTEM)/usr/idc/, $(notdir $(input_config))) ) \
    $(foreach keylayout_config, $(wildcard $(LOCAL_PATH)/configs/keylayout/*), \
    $(keylayout_config):$(addprefix $(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/, $(notdir $(keylayout_config))) ) \

# Libshims
PRODUCT_PACKAGES += \
    libshims_camera \
    libshims_ims

# Device-specific init script
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init/hw/init.target.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.target.rc

# Sensors configuration files
PRODUCT_COPY_FILES += $(foreach sensor_config, $(wildcard $(LOCAL_PATH)/configs/sensors/*), \
    $(sensor_config):$(addprefix $(TARGET_COPY_OUT_VENDOR)/etc/sensors/, $(notdir $(sensor_config))) )

# Wi-Fi and WCNSS configuration files
PRODUCT_COPY_FILES += $(foreach wifi_config, $(wildcard $(LOCAL_PATH)/configs/wifi/*), \
    $(wifi_config):$(addprefix $(TARGET_COPY_OUT_VENDOR)/etc/wifi/, $(notdir $(wifi_config))) ) \

# Inherit from msm8956-common
$(call inherit-product, device/xiaomi/msm8956-common/msm8956.mk)
