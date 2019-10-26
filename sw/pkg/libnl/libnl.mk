PKG = libnl
LIBNL_VERSION = 3.2.25
LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
LIBNL_SITE = https://www.infradead.org/~tgr/libnl/files/$(LIBNL_SOURCE)
LIBNL_DO_SDK_INSTALL = y

$(eval $(call artifact,$(TOP_DIR)/build/sdk/lib/libnl*.so*,/rootfs/lib))
$(eval $(automake-package))
