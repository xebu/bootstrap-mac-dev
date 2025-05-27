# ------------------------------------------------------------------------------
# Makefile for bootstrapping a macOS development machine
# Scripts are modular and can be run individually or grouped via targets.
# ------------------------------------------------------------------------------

SHELL := /bin/bash

.PHONY: all help list bootstrap bootstrap-preview prerequisites \
        code-folders homebrew ohmyzsh core-tools apps \
        macos-defaults containers python cloud fonts personal dotfiles cleanup

# Master script list
SCRIPTS = \
	scripts/00-create-code-folders.sh \
	scripts/01-homebrew.sh \
	scripts/02-ohmyzsh.sh \
	scripts/03-core-tools.sh \
	scripts/04-macos-defaults.sh \
	scripts/05-apps.sh \
	scripts/06-client-tools.sh \
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
	@chmod +x scripts/*.sh
	@echo "✅ Scripts made executable"

	@if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then \
		echo "⚙️  Disabling file mode tracking for this repo..."; \
		git config --local core.fileMode false; \
		echo "✅ Git local setting applied: core.fileMode=false"; \
	else \
		echo "ℹ️  Not in a Git repo — skipping local Git config"; \
	fi

# Per-target runners
code-folders:
	./scripts/00-create-code-folders.sh

homebrew:
	./scripts/01-homebrew.sh

ohmyzsh:
	./scripts/02-ohmyzsh.sh

core-tools:
	./scripts/03-core-tools.sh

apps:
	./scripts/05-apps.sh

macos-defaults:
	./scripts/04-macos-defaults.sh

containers:
	./scripts/08-containers.sh

python:
	./scripts/09-python.sh

cloud:
	./scripts/10-cloud-providers-and-dev-tools.sh

fonts:
	./scripts/11-fonts.sh

personal:
	./scripts/12-personal-casks.sh

dotfiles:
	./scripts/97-dotfiles.sh

cleanup:
	./scripts/99-post-setup.sh

list:
	@echo "🗂️  Available scripts:"
	@for script in $(SCRIPTS); do echo " - $$script"; done
	@echo ""
	@echo "🎯 Available targets:"
	@grep -E '^[a-zA-Z0-9_-]+:' Makefile | grep -v '\.PHONY' | sed 's/://g' | sort | xargs -n 1 echo " - "

help:
	@echo "Usage:"
	@echo "  make                   - Run full bootstrap"
	@echo "  make <target>          - Run an individual step"
	@echo "  make bootstrap-preview - Show the list of scripts without executing"
	@echo "  make prerequisites     - Ensure scripts are executable"
	@echo "  make list              - List all script files and targets"
	@echo "  make help              - Show this help message"
	@echo ""
	@echo "Targets:"
	@echo "  code-folders homebrew ohmyzsh core-tools apps macos-defaults"
	@echo "  containers python cloud fonts personal dotfiles cleanup"
