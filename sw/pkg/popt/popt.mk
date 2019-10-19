PKG = popt
POPT_VERSION = 1.16
POPT_SOURCE = popt-$(POPT_VERSION).tar.gz
POPT_SITE = https://launchpad.net/popt/head/1.16/+download/$(POPT_SOURCE)
POPT_DO_SDK_INSTALL = yes

$(eval $(automake-package))
