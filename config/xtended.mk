# Read maintainer and device lists
OFFICIAL_MAINTAINERS := $(shell cat xtended-maintainers/xtended.maintainers)
OFFICIAL_DEVICES := $(shell cat xtended-maintainers/xtended.devices)

# Check if device is official
IS_OFFICIAL_DEVICE := $(if $(findstring $(LINEAGE_BUILD),$(OFFICIAL_DEVICES)),true,false)

# Check if maintainer is official
IS_OFFICIAL_MAINTAINER := $(if $(findstring $(XTENDED_MAINTAINER),$(OFFICIAL_MAINTAINERS)),true,false)

# Set build type based on device and maintainer status
ifeq ($(IS_OFFICIAL_DEVICE)-$(IS_OFFICIAL_MAINTAINER),true-true)
    XTENDED_BUILDTYPE := OFFICIAL
else
    XTENDED_BUILDTYPE := Community
    ifeq ($(IS_OFFICIAL_DEVICE),true)
        $(warning **********************************************************************)
        $(warning *       There is already an official maintainer for $(LINEAGE_BUILD)       *)
        $(warning *                Setting build type to Community                      *)
        $(warning **********************************************************************)
    endif
endif

# Include updater for official builds only
ifeq ($(XTENDED_BUILDTYPE),OFFICIAL)
    PRODUCT_PACKAGES += Updater
    PRODUCT_COPY_FILES += \
        vendor/lineage/prebuilt/common/etc/init/init.lineage-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.lineage-updater.rc

    # Safety check - should never trigger unless there's a logic error
    ifeq ($(IS_OFFICIAL_DEVICE),false)
        $(error Build system error: Invalid official build configuration)
    endif
endif
