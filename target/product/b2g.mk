PRODUCT_NAME := b2g
PRODUCT_BRAND := generic
PRODUCT_DEVICE := generic

TARGET_PROVIDES_INIT_RC := true
CONFIG_ESD := no
HTTP := android

PRODUCT_PACKAGES := \
	b2g.sh \
	fakeperm \
	gaia \
	gecko \
	httpd.conf \
	init.rc \
	init.b2g.rc \
	rilproxy \
	OpenSans-BoldItalic.ttf \
	OpenSans-Bold.ttf \
	OpenSans-ExtraBoldItalic.ttf \
	OpenSans-ExtraBold.ttf \
	OpenSans-Italic.ttf \
	OpenSans-LightItalic.ttf \
	OpenSans-Light.ttf \
	OpenSans-Regular.ttf \
	OpenSans-SemiboldItalic.ttf \
	OpenSans-Semibold.ttf

ifneq (,$(realpath .repo/manifest.xml))
PRODUCT_PACKAGES += \
	sources.xml
endif
