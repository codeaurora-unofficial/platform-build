#!/bin/bash

echo "# begin build properties"
echo "# autogenerated by buildinfo.sh"

echo "ro.build.id=$BUILD_ID"
echo "ro.build.display.id=$BUILD_DISPLAY_ID"
echo "ro.build.version.incremental=$BUILD_NUMBER"
echo "ro.build.version.sdk=$PLATFORM_SDK_VERSION"
echo "ro.build.version.codename=$PLATFORM_VERSION_CODENAME"
echo "ro.build.version.release=$PLATFORM_VERSION"
echo "ro.build.date=`date`"
echo "ro.build.date.utc=`date +%s`"
echo "ro.build.type=$TARGET_BUILD_TYPE"
echo "ro.build.user=$USER"
echo "ro.build.host=`hostname`"
echo "ro.build.tags=$BUILD_VERSION_TAGS"
echo "ro.product.model=$PRODUCT_MODEL"
echo "ro.product.brand=$PRODUCT_BRAND"
echo "ro.product.name=$PRODUCT_NAME"
echo "ro.product.device=$TARGET_DEVICE"
echo "ro.product.board=$TARGET_BOOTLOADER_BOARD_NAME"
echo "ro.product.cpu.abi=$TARGET_CPU_ABI"
echo "ro.product.manufacturer=$PRODUCT_MANUFACTURER"
echo "ro.product.locale.language=$PRODUCT_DEFAULT_LANGUAGE"
echo "ro.product.locale.region=$PRODUCT_DEFAULT_REGION"
echo "ro.board.platform=$TARGET_BOARD_PLATFORM"

echo "# ro.build.product is obsolete; use ro.product.device"
echo "ro.build.product=$TARGET_DEVICE"

echo "# Do not try to parse ro.build.description or .fingerprint"
echo "ro.build.description=$PRIVATE_BUILD_DESC"
echo "ro.build.fingerprint=$BUILD_FINGERPRINT"

echo "# end build properties"
