PKG = kickstart-initrd

define KICKSTART-INITRD_BUILD_CMD
PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(MAKE) -C kickstart/src/initrd  \
									CROSS_COMPILE=$(TOOLCHAIN)- \
								    KS_SYSROOT=$(SYSROOT)
endef

$(eval $(generic-package))
