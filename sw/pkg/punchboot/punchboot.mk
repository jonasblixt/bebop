PKG = punchboot

define PUNCHBOOT_BUILD_CMD
$(MAKE) -C $(TOP_DIR)/punchboot/src BOARD=$(PB_BOARD_TARGET) \
								 BOARD_DIR=$(PB_BOARD_DIR) \
								 CROSS_COMPILE=$(PB_CROSS_COMPILE) \
								 LOGLEVEL=$(PB_LOGLEVEL)
endef

define BOOTIMAGE_CREATE
$(Q)$(PBIMAGE) $(PBC_FILE)
endef

$(eval $(generic-package))
