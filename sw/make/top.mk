BUILD_SYSTEM_VERSION = 1.0
TOP_DIR = $(shell readlink -f .)
ALL_TARGETS :=
PRE_ROOTFS_HOOKS =
PKG_CONFIG_PATH=$(TOP_DIR)/build/sdk/lib/pkgconfig

HOST_TOOLCHAIN = 

WGET = wget
TAR = tar
MAKE = make

ifndef VERBOSE
Q = @
else
Q =
endif

COMMON_CONFIGURE_OPTS += --host=$(TOOLCHAIN)
COMMON_CONFIGURE_OPTS += --prefix=$(TOP_DIR)/build/sdk
COMMON_CONFIGURE_OPTS += --exec-prefix=$(TOP_DIR)/build/sdk
COMMON_CONFIGURE_OPTS += --disable-makeinstall-chown
COMMON_CONFIGURE_OPTS += --disable-makeinstall-chgrp
COMMON_CONFIGURE_OPTS += --disable-makeinstall-setuid
COMMON_CONFIGURE_OPTS += PKG_CONFIG_PATH=$(TOP_DIR)/build/sdk/lib/pkgconfig
COMMON_CONFIGURE_OPTS += --sysconfdir=$(TOP_DIR)/build/sdk

CC = $(TOOLCHAIN)-gcc
AR = $(TOOLCHAIN)-ar
SIZE = $(TOOLCHAIN)-size

SYSROOT=$(shell $(TOOLCHAIN)-gcc -print-sysroot)

-include make/utils.mk
-include make/artifact.mk
-include make/toolchain.mk
-include make/rootfs.mk
-include make/pkg.mk
-include make/pkg-automake.mk

$(shell mkdir -p build)
$(shell mkdir -p build/host-tools/bin)
$(shell mkdir -p download)
$(info Build system: $(BUILD_SYSTEM_VERSION))
$(info Top directory: $(TOP_DIR))

.DEFAULT_GOAL := all
