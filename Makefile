.PHONY: docs

# Define TF_DOCS command to run terraform-docs via Docker
TF_DOCS = docker run --rm --volume $(shell pwd):/terraform-docs --workdir /terraform-docs quay.io/terraform-docs/terraform-docs:latest

# Docs target to generate documentation using terraform-docs inside Docker
docs: ## Generate documentation using Docker
	find stages -name '*.tf' -exec dirname {} \; | uniq | xargs -I % $(TF_DOCS) markdown --output-file README.md --output-mode replace % --hide-empty
