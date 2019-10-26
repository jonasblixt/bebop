
ROOTFS_DIR = $(TOP_DIR)/build/rootfs

init_rootfs:
	$(info Initializing rootfs)
	$(shell rm -rf $(ROOTFS_DIR))
	$(shell mkdir -p $(ROOTFS_DIR)/dev)
	$(shell mkdir -p $(ROOTFS_DIR)/proc)
	$(shell mkdir -p $(ROOTFS_DIR)/tmp)
	$(shell mkdir -p $(ROOTFS_DIR)/sys)
	$(shell mkdir -p $(ROOTFS_DIR)/lib)

rootfs_package:
	$(Q)rm -f build/root.squash
	$(Q)mksquashfs build/rootfs build/root.squash -noI -noD -noF -noX
	$(Q)ksmkfs $(TOP_DIR)/image.ksm
