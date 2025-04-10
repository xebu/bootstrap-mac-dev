# Bootstrap Makefile

SHELL := /bin/zsh
.SILENT:

all: prerequisites folders xcode homebrew core-tools containers python cloud fonts personal-casks apps macos ohmyzsh dotfiles post

prerequisites:
	chmod +x scripts/*.sh

folders:
	./scripts/00-create-code-folders.sh

xcode:
	./scripts/00-xcode-and-updates.sh

homebrew:
	./scripts/01-homebrew.sh

core-tools:
	./scripts/02-core-tools.sh

containers:
	./scripts/08-containers.sh

python:
	./scripts/09-python.sh

cloud:
	./scripts/10-cloud-providers.sh

fonts:
	./scripts/10-fonts.sh

personal-casks:
	./scripts/11-personal-casks.sh

apps:
	./scripts/03-apps.sh

macos:
	./scripts/04-macos-defaults.sh

ohmyzsh:
	./scripts/05-ohmyzsh.sh

dotfiles:
	cp dotfiles/.zshrc ~/
	cp dotfiles/.p10k.zsh ~/
	cp dotfiles/.editorconfig ~/
	cp dotfiles/.gitconfig ~/
	cp dotfiles/.gitignore_global ~/

post:
	./scripts/99-post-setup.sh

.PHONY: all prerequisites folders xcode homebrew core-tools containers python cloud fonts personal-casks apps macos ohmyzsh dotfiles post
