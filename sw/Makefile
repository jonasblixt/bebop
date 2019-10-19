TOOLCHAIN = arm-linux-gnueabihf
PBC_FILE = $(TOP_DIR)/image.pbc

-include make/top.mk
-include pkg/punchboot/punchboot.mk
-include pkg/punchboot/punchboot-tools.mk
PB_BOARD_TARGET = bebop
PB_BOARD_DIR = $(TOP_DIR)/board/pb
PB_LOGLEVEL = 2
PB_CROSS_COMPILE = arm-eabi-

-include pkg/util-linux/util-linux.mk
UTIL-LINUX_CONFIGURE_OPTS += --enable-libblkid
UTIL-LINUX_CONFIGURE_OPTS += --enable-libuuid


-include pkg/popt/popt.mk
-include pkg/libaio/libaio.mk
-include pkg/jsonc/jsonc.mk
-include pkg/lvm2/lvm2.mk
-include pkg/cryptsetup/cryptsetup.mk
-include pkg/kickstart/initrd.mk
-include make/bottom.mk

all: $(ALL_TARGETS)

