
ARTIFACT_CMDS =

define copy-file
$(info INSTALL $(1) -> $(dir build/$(2)))
$(Q)$(shell mkdir -p $(dir build/$(2)))
$(Q)cp -a $(1) build/$(2)
endef

define artifact
$(info Adding artifact $1)

ARTIFACT_CMDS += $$(call copy-file,$(1),$(2))
endef

collect-artifacts:
	$(ARTIFACT_CMDS)
