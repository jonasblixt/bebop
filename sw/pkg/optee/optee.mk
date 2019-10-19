PKGS += optee

build/.optee-build:
	@make -C optee_os/ PLATFORM=imx CROSS_COMPILE=$(CROSS_COMPILE)
	@cp optee_os/out/arm-plat-imx/core/tee.bin build/tee.bin
	@touch $@
build/.optee-download:
build/.optee-unpack:

optee-clean:
	@make -C optee_os/ PLATFORM=imx clean
