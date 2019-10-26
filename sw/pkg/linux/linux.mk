PKG = linux

define LINUX_BUILD_CMD
cp $(TOP_DIR)/kernel_defconfig $(TOP_DIR)/linux-imx \
		&& $(MAKE) -C $(TOP_DIR)/linux-imx -j8 ARCH=arm CROSS_COMPILE=$(TOOLCHAIN)- \
		&& $(MAKE) -C $(TOP_DIR)/linux-imx -j8 ARCH=arm CROSS_COMPILE=$(TOOLCHAIN)- jiffy.dtb
endef

define LINUX_PRE_ROOTFS_HOOK
$(make -C linux-imx/ ARCH=arm modules_install INSTALL_MOD_PATH=$(TOP_DIR)/build/rootfs)
endef

linux-menuconfig:
	@make -C linux-imx/ ARCH=arm MENUCONFIG_COLOR=classic menuconfig
	@cp linux-imx/.config ./kernel_defconfig

$(eval $(call artifact,$(TOP_DIR)/linux-imx/arch/arm/boot/zImage,/))
$(eval $(call artifact,$(TOP_DIR)/linux-imx/arch/arm/boot/dts/jiffy.dtb,/dt.dtb))
$(eval $(generic-package))
