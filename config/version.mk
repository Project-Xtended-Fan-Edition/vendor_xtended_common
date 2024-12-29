# Branding
CUSTOM_BRAND := Project-Xtended

# Project-Xtended Version
XTENDED_VERSION := 2.0-Fan-Edition
XTENDED_CODENAME := Hades
XTENDED_BUILDTYPE ?= Community

CUSTOM_BUILD_DATE := $(shell date +%Y%m%d-%H%M)
CUSTOM_BUILD_DATE_UTC := $(shell date '+%Y-%m-%d %H:%M UTC %s')
CUSTOM_BUILD_VERSION := $(BUILD_ID)

CUSTOM_VERSION := $(CUSTOM_BRAND)-$(XTENDED_VERSION)-$(XTENDED_BUILDTYPE)_$(LINEAGE_BUILD)-$(XTENDED_EDITION)-$(CUSTOM_BUILD_DATE)

PRODUCT_BRAND := $(CUSTOM_BRAND)
LINEAGE_BUILD_DATE := $(CUSTOM_BUILD_DATE)
LINEAGE_VERSION := $(CUSTOM_VERSION)
LINEAGE_DISPLAY_VERSION := $(CUSTOM_BUILD_VERSION)
LINEAGE_BUILDTYPE := $(XTENDED_BUILDTYPE)

# Versioning props
PRODUCT_SYSTEM_PROPERTIES += \
    ro.custom.brand=$(PRODUCT_BRAND) \
    ro.custom.build.version=$(PLATFORM_DISPLAY_VERSION).$(CUSTOM_BUILD_VERSION) \
    ro.custom.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.custom.version=$(LINEAGE_VERSION) \
    ro.modversion=$(LINEAGE_VERSION) \
    ro.xtended.buildtype=$(LINEAGE_BUILDTYPE) \
    ro.xtended.version=$(XTENDED_VERSION) \
    ro.xtended.codename=$(XTENDED_CODENAME) \
    ro.xtended.edition=$(XTENDED_EDITION)
