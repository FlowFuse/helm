.PHONY: install upgrade uninstall

NAMESPACE ?= devices

DEV_FILE ?= device.yml

install-azure upgrade-azure template-azure: $(DEV_FILE)
	helm $(subst -azure,,$@) \
		flowforge-device \
		. \
		--values values-azure.yaml \
		--set provisioningToken=$(shell base64 -i $(DEV_FILE)) \
		--create-namespace \
		--namespace=$(NAMESPACE)

install-aws upgrade-aws template-aws: $(DEV_FILE)
	helm $(subst -aws,,$@) \
		flowforge-device \
		. \
		--values values-aws.yaml \
		--set provisioningToken=$(shell base64 -i $(DEV_FILE)) \
		--create-namespace \
		--namespace=$(NAMESPACE)

uninstall:
	helm $@ \
		flowforge-device

template-debug-azure: device.yml
	helm template \
		flowforge-device \
		. \
		--values values-azure.yaml \
		--set provisioningToken=$(shell base64 -i $(DEV_FILE)) \
		--debug
