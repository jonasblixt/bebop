PKG = lvm2
LVM2_VERSION = 2.03.05
LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/$(LVM2_SOURCE)

LVM2_CONFIGURE_OPTS =   --disable-nls \
                        --disable-cmdlib \
                        --disable-makeinstall-chown \
                        --disable-dmeventd \
                        --disable-fsadm \
                        --disable-dbus-service \
                        --disable-devmapper \
                        --disable-readline \
                        --disable-selinux \
                        --disable-dmsetup \
                        --enable-static_link
LVM2_DO_SDK_INSTALL = yes

LVM2_CONFIGURE_OPTS += CFLAGS=-I$(TOP_DIR)/build/sdk/include
LVM2_CONFIGURE_OPTS += LDFLAGS="-L$(TOP_DIR)/build/sdk/lib"
LVM2_CONFIGURE_OPTS += BLKID_LIBS=$(TOP_DIR)/build/sdk/lib/libblkid.so
LVM2_CONFIGURE_OPTS += --prefix=$(TOP_DIR)/build/sdk

LVM2_ENV  = ac_cv_func_realloc_0_nonnull=yes
LVM2_ENV += ac_cv_func_malloc_0_nonnull=yes

# Overide source-dir since folder does not match archive name
LVM2_SOURCE_DIR = $(TOP_DIR)/build/lvm2/LVM2.$(LVM2_VERSION)

LVM2_BUILD_CMD = cd $(LVM2_SOURCE_DIR) && make -C libdm/ libdevmapper.so
LVM2_SDK_INSTALL_CMD = cd $(LVM2_SOURCE_DIR) \
				&& make -C libdm/ install_dynamic \
				&& make -C libdm/ install_static \
				&& make -C libdm/ install_pkgconfig \
    			&& make -C libdm/ install_include

$(eval $(call artifact,$(TOP_DIR)/build/sdk/lib/libdevmapper.so.*,rootfs/lib/))
$(eval $(automake-package))
