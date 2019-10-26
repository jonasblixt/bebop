PKG = kickstart-tools
KICKSTART-TOOLS_DO_HOST_TOOLS_INSTALL = yes

define KICKSTART-TOOLS_BUILD_CMD
$(MAKE) -C $(TOP_DIR)/kickstart/src/tools/ksmkfs CROSS_COMPILE=$(HOST_TOOLCHAIN)
endef

define KICKSTART-TOOLS_HOST_TOOLS_INSTALL_CMD
$(MAKE) -C $(TOP_DIR)/kickstart/src/tools/ksmkfs PREFIX=$(TOP_DIR)/build/host-tools/bin install
endef

$(eval $(generic-package))
