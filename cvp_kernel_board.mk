# Build eva kernel driver
#ifneq ($(TARGET_BOARD_AUTO),true)
#ifeq ($(call is-board-platform-in-list,$(TARGET_BOARD_PLATFORM)),true)
#ifneq ($(call is-board-platform-in-list,parrot),true)


ENABLE_EVA_KERNEL := true
ifeq ($(TARGET_KERNEL_DLKM_DISABLE), true)
ifneq ($(TARGET_KERNEL_DLKM_CVP_OVERRIDE), true)
ENABLE_EVA_KERNEL := false
endif
endif

ifeq ($(ENABLE_EVA_KERNEL), true)
BOARD_VENDOR_KERNEL_MODULES += $(KERNEL_MODULES_OUT)/msm-cvp.ko
endif
#endif
#endif
#endif
