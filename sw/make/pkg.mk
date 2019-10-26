
build/%/.stamp_download:
	$(info Downloading $(PKG))
	$(Q)if [ ! -f download/$($(PKG)_SOURCE) ]; then \
		curl -sL $($(PKG)_SITE) > download/$($(PKG)_SOURCE); \
	fi
	@touch $@

build/%/.stamp_extract:
	$(info Extract $(PKG))
	$(Q)$(TAR) xf download/$($(PKG)_SOURCE) -C $($(PKG)_DIR)
	@touch $@

build/%/.stamp_patch:
	$(info Patch $(PKG))
	$(foreach patch,$($(PKG)_PATCH_FILES), \
		$(Q) cd $($(PKG)_SOURCE_DIR) && patch -p1 < $(TOP_DIR)/$(patch))
	@touch $@

build/%/.stamp_configure:
	$(info Configuring $(PKG))
	$(Q)cd $($(PKG)_SOURCE_DIR) && $($(PKG)_ENV) ./configure $(COMMON_CONFIGURE_OPTS) \
											   $($(PKG)_CONFIGURE_OPTS)
	@touch $@

build/%/.stamp_build:
	$(info Building $(PKG))
	$($(PKG)_ENV) $($(PKG)_BUILD_CMD)
	@touch $@

build/%/.stamp_sdk_install:
	$(info SDK Install $(PKG))
	$($(PKG)_ENV) $($(PKG)_SDK_INSTALL_CMD)
	@touch $@

build/%/.stamp_host_tools_install:
	$(info SDK Install $(PKG))
	$($(PKG)_ENV) $($(PKG)_HOST_TOOLS_INSTALL_CMD)
	@touch $@

%-rebuild:
	$(info Rebuilding $(PKG))
	@rm -f $(TOP_DIR)/build/$(call LC,$(PKG))/.stamp_build
	@rm -f $(TOP_DIR)/build/$(call LC,$(PKG))/.stamp_install*
	$(MAKE) all

# $(1) = Package name, lower case
# $(2) = Package name, upper case
define generic-package-inner
$(shell mkdir -p build/$(1))

ifndef $(2)_ENV
$(2)ENV =
endif

$(2)_ENV += PKG_CONFIG_PATH=$(PKG_CONFIG_PATH)

ifndef $(2)_SOURCE_DIR
$(2)_SOURCE_DIR = build/$(1)/$(1)-$$($(2)_VERSION)
endif

$(2)_DIR = build/$(1)

ifndef $(2)_BUILD_CMD
$(2)_BUILD_CMD = $$(MAKE) -C $$($(2)_SOURCE_DIR)
endif

ifndef $(2)_SDK_INSTALL_CMD
$(2)_SDK_INSTALL_CMD = $$(MAKE) -C $$($(2)_SOURCE_DIR) $$($(2)_SDK_INSTALL_OPTS) install
endif

ifndef $(2)_HOST_TOOLS_INSTALL_CMD
$(2)_HOST_TOOLS_INSTALL_CMD = $$(MAKE) -C $$($(2)_SOURCE_DIR) $$($(2)_HOST_TOOLS_INSTALL_OPTS) install
endif

$(2)_CONFIGURE ?=
$(2)_CONFIGURE_OPTS ?=
$(2)_HOST_TOOLS_INSTALL_OPTS ?=

$(2)_PATCH_FILES  = $$(wildcard pkg/$(1)/*.patch)
$(2)_BUILD_TARGET = build/$(1)/.stamp_build
$(2)_EXTRACT 	  = build/$(1)/.stamp_extract
$(2)_PATCH		  = build/$(1)/.stamp_patch
$(2)_DOWNLOAD     = build/$(1)/.stamp_download
$(2)_SDK_INSTALL  = build/$(1)/.stamp_sdk_install
$(2)_HOST_TOOLS_INSTALL  = build/$(1)/.stamp_host_tools_install

ifdef $(2)_SITE
ALL_TARGETS += $$($(2)_DOWNLOAD)
ALL_TARGETS += $$($(2)_EXTRACT)
ALL_TARGETS += $$($(2)_PATCH)
endif

ifdef $(2)_PRE_CONFIGURE
ALL_TARGETS += $$($(2)_PRE_CONFIGURE)
endif

ALL_TARGETS += $$($(2)_CONFIGURE)
ALL_TARGETS += $$($(2)_BUILD_TARGET)

ifdef $(2)_DO_SDK_INSTALL
ALL_TARGETS += $$($(2)_SDK_INSTALL)
endif

ifdef $(2)_DO_HOST_TOOLS_INSTALL
ALL_TARGETS += $$($(2)_HOST_TOOLS_INSTALL)
endif

ifdef $(2)_PRE_ROOTFS_HOOK
PRE_ROOTFS_HOOKS += $$($(2)_PRE_ROOTFS_HOOK)
endif

$$($(2)_BUILD_TARGET): PKG=$(2)
$$($(2)_DOWNLOAD): PKG=$(2)
$$($(2)_EXTRACT): PKG=$(2)
$$($(2)_CONFIGURE): PKG=$(2)
$$($(2)_PATCH): PKG=$(2)
$$($(2)_SDK_INSTALL): PKG=$(2)
$$($(2)_HOST_TOOLS_INSTALL): PKG=$(2)

# Convenienc targets
$(1)-rebuild: PKG=$(1)

endef

generic-package = $(call generic-package-inner,$(PKG),$(call UC,$(PKG)))
