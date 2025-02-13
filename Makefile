.DEFAULT_GOAL := all
DOTFILES_DIR := $$PWD/dotfiles
TOOLS_DIR := $$PWD/tools

sample:
	echo $(DOTFILES_DIR)

all: create_dirs deps links

create_dirs:
	mkdir -p ./tools ./tools/downloads ./tools/bin $$HOME/.config

deps: create_dirs
	@if [ ! -f "./bin/tmux" ]; then \
		$(TOOLS_DIR)/shells/install_tmux.sh; \
	fi
	@if [ ! -f "./bin/nvim" ]; then \
		$(TOOLS_DIR)/shells/install_neovim.sh; \
	fi

define create_symlink
	@if [ -L "$(1)" ]; then \
		ln -sf "$(2)" "$(1)"; \
	elif [ -f "$(1)" ]; then \
		mv "$(1)" "$(1).backup"; \
		ln -sf "$(2)" "$(1)"; \
	else \
		ln -sf "$(2)" "$(1)"; \
	fi
endef

links:
	# .bash_profile
	$(call create_symlink,$$HOME/.bash_profile,$(DOTFILES_DIR)/.bash_profile)

	# .tmux.conf
	$(call create_symlink,$$HOME/.tmux.conf,$(DOTFILES_DIR)/.tmux.conf)

	# .config/tmux
	$(call create_symlink,$$HOME/.config/tmux,$(DOTFILES_DIR)/config/tmux)

	# .config/nvim
	$(call create_symlink,$$HOME/.config/nvim,$(DOTFILES_DIR)/config/nvim)

	# nvim
	ln -sf "$(TOOLS_DIR)/downloads/neovim/build/bin/nvim" "$(TOOLS_DIR)/bin/nvim"
	# tmux
	ln -sf "$(TOOLS_DIR)/downloads/tmux/tmux" "$(TOOLS_DIR)/bin/tmux"
	# fzf
	ln -sf "$(TOOLS_DIR)/downloads/fzf/bin/fzf" "$(TOOLS_DIR)/bin/fzf"
