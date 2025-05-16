# ------------------------------------------------------------------------------
# Makefile for bootstrapping a macOS development machine
# Scripts are modular and can be run individually or grouped via targets.
# ------------------------------------------------------------------------------

SHELL := /bin/bash

.PHONY: all help list bootstrap bootstrap-preview prerequisites \
        code-folders homebrew core-tools apps \
        macos-defaults ohmyzsh containers python \
        cloud tooling fonts personal dotfiles cleanup

# Master script list
SCRIPTS = \
	scripts/00-create-code-folders \
	scripts/01-homebrew.sh \
	scripts/02-core-tools.sh \
	scripts/03-apps.sh \
	scripts/04-macos-defaults.sh \
	scripts/05-ohmyzsh.sh \
	scripts/08-containers.sh \
	scripts/09-python.sh \
	scripts/10-cloud-providers-and-dev-tools.sh \
	scripts/11-fonts.sh \
	scripts/12-personal-casks.sh \
	scripts/97-dotfiles.sh \
	scripts/99-post-setup.sh

# Top-level commands
all: bootstrap

bootstrap:
	@for script in $(SCRIPTS); do \
		echo "🔧 Running $$script..."; \
		$$script; \
	done

bootstrap-preview:
	@echo "🧪 Preview of bootstrap steps (scripts will NOT be executed):"
	@for script in $(SCRIPTS); do \
		echo "🔸 $$script"; \
	done

# Utility: ensure scripts are executable
prerequisites:
	chmod +x scripts/*.sh

# Per-target runners
code-folders:
	scripts/00-create-code-folders

homebrew:
	scripts/01-homebrew.sh

core-tools:
	bash scripts/02-core-tools.sh

apps:
	scripts/03-apps.sh

macos-defaults:
	scripts/04-macos-defaults.sh

ohmyzsh:
	scripts/05-ohmyzsh.sh

containers:
	scripts/08-containers.sh

python:
	scripts/09-python.sh

cloud:
	scripts/10-cloud-providers-and-dev-tools.sh

fonts:
	scripts/11-fonts.sh

personal:
	scripts/12-personal-casks.sh

dotfiles:
	scripts/97-dotfiles.sh

cleanup:
	scripts/99-post-setup.sh

list:
	@echo "🗂️  Available scripts:"
	@for script in $(SCRIPTS); do echo " - $$script"; done

help:
	@echo "Usage:"
	@echo "  make                   - Run full bootstrap"
	@echo "  make <target>          - Run an individual step"
	@echo "  make bootstrap-preview - Show the list of scripts without executing"
	@echo "  make prerequisites     - Ensure scripts are executable"
	@echo "  make list              - List all script files"
	@echo "  make help              - Show this help message"
	@echo ""
	@echo "Targets:"
	@echo "  code-folders homebrew core-tools apps macos-defaults"
	@echo "  ohmyzsh containers python cloud fonts personal dotfiles cleanup"
