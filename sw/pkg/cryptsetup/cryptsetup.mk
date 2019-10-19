PKG=cryptsetup
CRYPTSETUP_VERSION=2.1.0
CRYPTSETUP_SOURCE=cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
CRYPTSETUP_SITE = https://www.kernel.org/pub/linux/utils/cryptsetup/v2.1/$(CRYPTSETUP_SOURCE)
CRYPTSETUP_DO_SDK_INSTALL = yes

CRYPTSETUP_CONFIGURE_OPTS = CFLAGS=-I$(TOP_DIR)/build/sdk/include \
				            LDFLAGS=-L$(TOP_DIR)/build/sdk/lib \
            				--with-crypto_backend=kernel \
            				--enable-static \
							--with-tmpfilesdir=/tmp \
            				--enable-static-libs

$(eval $(automake-package))
