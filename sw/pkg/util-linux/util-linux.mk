PKG = util-linux
UTIL-LINUX_VERSION = 2.34
UTIL-LINUX_SOURCE = util-linux-$(UTIL-LINUX_VERSION).tar.gz
UTIL-LINUX_SITE = https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v$(UTIL-LINUX_VERSION)/$(UTIL-LINUX_SOURCE)
UTIL-LINUX_DO_SDK_INSTALL = yes

UTIL-LINUX_CONFIGURE_OPTS  = --disable-all-programs

$(eval $(automake-package))
