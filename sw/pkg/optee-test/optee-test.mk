PKG = optee_test
OPTEE_TEST_VERSION = 3.6.0
OPTEE_TEST_SOURCE = optee_test-$(OPTEE_TEST_VERSION).tar.gz
OPTEE_TEST_SITE = https://github.com/OP-TEE/optee_test/archive/$(OPTEE_TEST_VERSION).tar.gz


define OPTEE_TEST_BUILD_CMD
make -C $(OPTEE_TEST_SOURCE_DIR) \
	TA_DEV_KIT_DIR=$(TOP_DIR)/optee_os/out/arm-plat-imx/export-ta_arm32/ \
	OPTEE_CLIENT_EXPORT=$(OPTEE-CLIENT_SOURCE_DIR)/out/export/usr \
	COMPILE_NS_USER=32 \
	CROSS_COMPILE=$(TOOLCHAIN)-
endef

$(eval $(generic-package))
