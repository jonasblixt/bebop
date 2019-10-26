.PHONY: create_boot_image create_initrd_image create_rootfs

create_boot_image:
	$(info Generating boot image)
	$(BOOTIMAGE_CREATE)

create_initrd_image:
	$(info Generating initrd image)
	$(INITRDIMAGE_CREATE)

create_rootfs:
	$(info Generating rootfs)
	$(ROOTFS_CREATE)

ifndef BOOTIMAGE_CREATE
define BOOTIMAGE_CREATE
$(info BOOTIMAGE_CREATE not defined, doing nothing.)
endef
endif

ifndef INITRDIMAGE_CREATE
define INITRDIMAGE_CREATE
$(info INITRDIMAGE_CREATE not defined, doing nothing.)
endef
endif

ifndef ROOTFS_CREATE
define ROOTFS_CREATE
$(info ROOTFS_CREATE not defined, doing nothing.)
endef
endif


ALL_TARGETS += init_rootfs
ALL_TARGETS += $(PRE_ROOTFS_HOOKS)
ALL_TARGETS += collect-artifacts
ALL_TARGETS += create_initrd_image
ALL_TARGETS += create_rootfs
ALL_TARGETS += rootfs_package
ALL_TARGETS += create_boot_image
