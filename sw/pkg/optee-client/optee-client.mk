PKG = optee-client
OPTEE-CLIENT_VERSION = 3.6.0
OPTEE-CLIENT_SOURCE = $(OPTEE-CLIENT_VERSION).tar.gz
OPTEE-CLIENT_SOURCE_DIR = $(TOP_DIR)/build/optee-client/optee_client-$(OPTEE-CLIENT_VERSION)
OPTEE-CLIENT_SITE = https://github.com/OP-TEE/optee_client/archive/$(OPTEE-CLIENT_SOURCE)
OPTEE-CLIENT_DO_SDK_INSTALL = yes

define OPTEE-CLIENT_PRE_ROOTFS_HOOK
$(shell mkdir -p $(ROOTFS_DIR)/data/tee)
endef

$(eval $(call artifact,$(OPTEE-CLIENT_SOURCE_DIR)/out/export/usr/sbin/tee-supplicant,rootfs/))
$(eval $(call artifact,$(OPTEE-CLIENT_SOURCE_DIR)/out/export/usr/lib/libteec.so*,rootfs/lib/))
$(eval $(generic-package))
