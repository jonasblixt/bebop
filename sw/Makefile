TOOLCHAIN = arm-linux-gnueabihf
PBC_FILE = $(TOP_DIR)/image.pbc

include make/top.mk
include pkg/punchboot/punchboot.mk
include pkg/punchboot/punchboot-tools.mk
PB_BOARD_TARGET = bebop
PB_BOARD_DIR = $(TOP_DIR)/board/pb
PB_LOGLEVEL = 2
PB_CROSS_COMPILE = arm-eabi-
PB_AUTH_COOKIE ?= $(TOP_DIR)/990E4B1D-B979-3933-93E3-038346C7A56F.token
PB_FLASH_CMDS += punchboot part -w -n 2 -f $(TOP_DIR)/build/image.ksfs

include pkg/linux/linux.mk
include pkg/util-linux/util-linux.mk
UTIL-LINUX_CONFIGURE_OPTS += --enable-libblkid
UTIL-LINUX_CONFIGURE_OPTS += --enable-libuuid

include pkg/optee/optee.mk
include pkg/zlib/zlib.mk
include pkg/popt/popt.mk
include pkg/libaio/libaio.mk
include pkg/jsonc/jsonc.mk
include pkg/lvm2/lvm2.mk
include pkg/cryptsetup/cryptsetup.mk
include pkg/libnl/libnl.mk
KS_INITRD_KEYS  = punchboot/pki/secp256r1-pub-key.der
KS_INITRD_KEYS += punchboot/pki/secp384r1-pub-key.der
KS_INITRD_KEYS += punchboot/pki/secp521r1-pub-key.der
include pkg/kickstart/initrd.mk
include pkg/kickstart/kickstart-tools.mk
KS_BOARD=bebop
include pkg/kickstart/kickstart.mk
include pkg/optee-client/optee-client.mk
#include pkg/optee-test/optee-test.mk
#include pkg/toybox/toybox.mk
include make/bottom.mk

all: $(ALL_TARGETS)

