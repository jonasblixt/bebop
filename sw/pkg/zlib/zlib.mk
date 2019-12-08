PKG = zlib
ZLIB_VERSION = 1.2.11
ZLIB_SOURCE = zlib-$(ZLIB_VERSION).tar.gz
ZLIB_SITE = https://www.zlib.net/$(ZLIB_SOURCE)
ZLIB_DO_SDK_INSTALL = yes

ZLIB_BUILD_CMD = cd $(ZLIB_SOURCE_DIR) && CC=$(TOOLCHAIN)-gcc ./configure --prefix / \
				 && make CC=$(TOOLCHAIN)-gcc

ZLIB_SDK_INSTALL_CMD = cd $(ZLIB_SOURCE_DIR) && make install DESTDIR=$(TOP_DIR)/build/sdk

$(eval $(call artifact,$(TOP_DIR)/build/sdk/lib/libz.so*,rootfs/lib/))
$(eval $(generic-package))
