PKG = optee

OPTEE_SOURCE_DIR = $(TOP_DIR)/optee_os/

define OPTEE_BUILD_CMD
$(MAKE) -C $(OPTEE_SOURCE_DIR) \
			PLATFORM=imx \
			CROSS_COMPILE=$(TOOLCHAIN)- \
			CFG_TEE_CORE_LOG_LEVEL=4 \
			CFG_UART_BASE=UART2_BASE \
			CFG_NS_ENTRY_ADDR=0x83000000
endef

$(eval $(call artifact,$(TOP_DIR)/optee_os/out/arm-plat-imx/core/tee-pager_v2.bin,/tee.bin))
$(eval $(generic-package))
