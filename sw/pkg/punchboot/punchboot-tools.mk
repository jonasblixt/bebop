PKG = punchboot-tools
PUNCHBOOT-TOOLS_DO_HOST_TOOLS_INSTALL = yes

define PUNCHBOOT-TOOLS_BUILD_CMD
$(Q)$(MAKE) -C $(TOP_DIR)/punchboot/src/tools CROSS_COMPILE=$(HOST_TOOLCHAIN)
endef

define PUNCHBOOT-TOOLS_HOST_TOOLS_INSTALL_CMD
$(Q)$(MAKE) -C $(TOP_DIR)/punchboot/src/tools/punchboot install PREFIX=$(TOP_DIR)/build/host-tools/
$(Q)$(MAKE) -C $(TOP_DIR)/punchboot/src/tools/pbimage install PREFIX=$(TOP_DIR)/build/host-tools/bin/
endef

PBIMAGE=$(TOP_DIR)/build/host-tools/bin/pbimage
PUNCHBOOT=$(TOP_DIR)/build/host-tools/bin/punchboot

$(eval $(generic-package))
