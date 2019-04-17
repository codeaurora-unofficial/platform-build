# BoardConfigMainlineCommon.mk
#
# Common compile-time definitions for mainline images.

# The generic product target doesn't have any hardware-specific pieces.
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_NO_RECOVERY := true

TARGET_USERIMAGES_USE_EXT4 := true

# Mainline devices must have /vendor and /product partitions.
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_PRODUCT := product
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_VNDK_VERSION := current

# Required flag for non-64 bit devices from P.
TARGET_USES_64_BIT_BINDER := true

# 64 bit mediadrmserver
TARGET_ENABLE_MEDIADRM_64 := true

# Puts odex files on system_other, as well as causing dex files not to get
# stripped from APKs.
BOARD_USES_SYSTEM_OTHER_ODEX := true

# Audio: must using XML format for Treblized devices
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth defines
# TODO(b/123695868): Remove the need for this
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := build/make/target/board/mainline_arm64/bluetooth

BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

BOARD_CHARGER_ENABLE_SUSPEND := true

# Enable A/B update
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := system

# Enable system property split for Treble
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
