.PHONY: create_boot_image

create_boot_image:
	$(info Generating boot image)
	$(BOOTIMAGE_CREATE)

ifndef BOOTIMAGE_CREATE
define BOOTIMAGE_CREATE
$(info BOOTIMAGE_CREATE not defined, doing nothing.)
endef
endif

ALL_TARGETS += create_boot_image
