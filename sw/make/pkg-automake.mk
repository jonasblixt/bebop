
define automake-package-inner

$(PKG)_AUTOMAKE_PKG = true

$(2)_CONFIGURE    = build/$(1)/.stamp_configure

$(call generic-package,$(PKG))
endef

automake-package = $(call automake-package-inner,$(PKG),$(call UC,$(PKG)))
