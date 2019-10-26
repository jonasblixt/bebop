PKG = jsonc

JSONC_VERSION = 0.13.1-20180305
JSONC_SOURCE = json-c-$(JSONC_VERSION).tar.gz
JSONC_SITE = https://github.com/json-c/json-c/archive/$(JSONC_SOURCE)
JSONC_DO_SDK_INSTALL = yes
JSONC_CONFIGURE_OPTS += --enable-static

# Overide source-dir since folder does not match archive name
JSONC_SOURCE_DIR = $(TOP_DIR)/build/jsonc/json-c-json-c-$(JSONC_VERSION)

$(eval $(call artifact,$(TOP_DIR)/build/sdk/lib/libjson-c.so*,rootfs/lib/))
$(eval $(automake-package))
