PKG = toybox
TOYBOX_VERSION = 0.8.2
TOYBOX_SOURCE = toybox-$(TOYBOX_VERSION).tar.gz
TOYBOX_SITE = https://github.com/landley/toybox/archive/$(TOYBOX_VERSION).tar.gz

TOYBOX_ENV = CC=$(TOOLCHAIN)-gcc

toybox-install-config:
	@cp $(TOP_DIR)/pkg/toybox/config $(TOYBOX_SOURCE_DIR)/.config

toybox-install:
	@make -C build/toybox/toybox-$(TOYBOX_VERSION) install PREFIX=$(ROOTFS_DIR)/

TOYBOX_PRE_ROOTFS_HOOK = toybox-install
TOYBOX_PRE_CONFIGURE = toybox-install-config

$(eval $(automake-package))
