# Battery Status Viewer
PRODUCT_PACKAGES += \
    BatteryStatsViewer

# BtHelper
PRODUCT_PACKAGES += \
    BtHelper

ifneq ($(MAINLINE_INCLUDE_BTSERVICES_MODULE),false)
# Ship custom libbluetooth_jni to system partition
PRODUCT_PACKAGES += \
    libbluetooth_jni
endif

# Aperture
ifneq ($(PRODUCT_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    PixelConfigOverlayAperture \
    PixelLauncherCustomOverlayAperture \
    SystemUICustomOverlayAperture
endif #PRODUCT_NO_CAMERA

# Game Space
PRODUCT_PACKAGES += \
    GameSpace

# SystemUI Flag configuration
PRODUCT_PACKAGES += \
    SystemUIFlagFlipper

# Face Unlock
ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
TARGET_FACE_UNLOCK_SUPPORTED ?= true

PRODUCT_PACKAGES += \
    AOSPASettingsOverlay

ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    ParanoidSense

PRODUCT_SYSTEM_PROPERTIES += \
    ro.face.sense_service=$(TARGET_FACE_UNLOCK_SUPPORTED)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif
endif

# ColumbusService
ifeq ($(TARGET_SUPPORTS_QUICK_TAP),true)
PRODUCT_PACKAGES += \
    ColumbusService
endif
