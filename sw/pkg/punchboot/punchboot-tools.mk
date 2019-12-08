PKG = punchboot-tools
PUNCHBOOT-TOOLS_DO_HOST_TOOLS_INSTALL = yes

define PUNCHBOOT-TOOLS_BUILD_CMD
$(MAKE) -C $(TOP_DIR)/punchboot/src/tools/pbimage/src CROSS_COMPILE=$(HOST_TOOLCHAIN)
$(MAKE) -C $(TOP_DIR)/punchboot/src/tools/punchboot/src CROSS_COMPILE=$(HOST_TOOLCHAIN)
endef

define PUNCHBOOT-TOOLS_HOST_TOOLS_INSTALL_CMD
$(MAKE) -C $(TOP_DIR)/punchboot/src/tools/punchboot/src install PREFIX=$(TOP_DIR)/build/host-tools/
$(MAKE) -C $(TOP_DIR)/punchboot/src/tools/pbimage/src install PREFIX=$(TOP_DIR)/build/host-tools/bin/
endef

PBIMAGE=$(TOP_DIR)/build/host-tools/bin/pbimage
PUNCHBOOT=$(TOP_DIR)/build/host-tools/bin/punchboot

pb-auth:
	$(Q)$(PUNCHBOOT) dev -a -s secp256r1:sha256 -n 0 -f $(PB_AUTH_COOKIE)

pb-ram-boot: pb-auth
	$(Q)$(PUNCHBOOT) boot -x $(PB_EXTRA_OPTS) -f $(TOP_DIR)/build/boot.pbi

pb-bl-flash: pb-auth
	$(Q)$(PUNCHBOOT) boot -w -r -f $(TOP_DIR)/punchboot/src/build-bebop/pb_signed.imx

pb-flash: pb-auth
	$(foreach cmd, $(PB_FLASH_CMDS), $(cmd))

$(eval $(generic-package))
