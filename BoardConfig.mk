# Project-XtendedConfiguration
VENDOR_EVEREST_COMMON_DIR := vendor/everest/common
include $(VENDOR_EVEREST_COMMON_DIR)/config/BoardConfig.mk

# Parasite Certification
include vendor/parasite/certification/BoardConfig.mk

# Sepolicies
-include device/parasite/sepolicy/common/sepolicy.mk
