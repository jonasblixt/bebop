PKG = kickstart

define KICKSTART_BUILD_CMD
$(MAKE) -C kickstart/src/  \
				CROSS_COMPILE=$(TOOLCHAIN)- \
				KS_SYSROOT=$(TOP_DIR)/build/sdk \
 				BOARD=$(KS_BOARD)
endef

$(eval $(call artifact,kickstart/src/build/kickstart,rootfs/kickstart))
$(eval $(generic-package))
