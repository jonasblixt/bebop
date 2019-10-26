PKG = kickstart-initrd

define KICKSTART-INITRD_BUILD_CMD
$(MAKE) -C kickstart/src/initrd  \
					CROSS_COMPILE=$(TOOLCHAIN)- \
				    KS_SYSROOT=$(SYSROOT) \
					BOARD=$(KS_BOARD)
endef

define INITRDIMAGE_CREATE
$(Q)mkdir -p $(TOP_DIR)/build/initrd
$(Q)mkdir -p $(TOP_DIR)/build/initrd/proc
$(Q)mkdir -p $(TOP_DIR)/build/initrd/sys
$(Q)mkdir -p $(TOP_DIR)/build/initrd/dev
$(Q)mkdir -p $(TOP_DIR)/build/initrd/tmp
$(Q)mkdir -p $(TOP_DIR)/build/initrd/newroot
$(Q)mkdir -p $(TOP_DIR)/build/initrd/data/tee
$(Q)cp $(TOP_DIR)/kickstart/src/build/initrd/kickstart-initrd $(TOP_DIR)/build/initrd/init
$(Q)cd $(TOP_DIR)/build/initrd && find . | cpio -H newc -o > ../initrd.cpio
endef

$(eval $(generic-package))
