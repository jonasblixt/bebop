PKG = libaio
LIBAIO_VERSION = 0.3.111
LIBAIO_SOURCE = libaio-$(LIBAIO_VERSION).tar.gz
LIBAIO_SITE = https://pagure.io/libaio/archive/libaio-$(LIBAIO_VERSION)/$(LIBAIO_SOURCE)
LIBAIO_DO_SDK_INSTALL = yes
LIBAIO_SDK_INSTALL_OPTS = prefix=$(TOP_DIR)/build/sdk
LIBAIO_ENV = CC=$(TOOLCHAIN)-gcc

$(eval $(generic-package))
