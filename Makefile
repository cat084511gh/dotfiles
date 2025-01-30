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

links:
	# .bash_profile
	@if [ -L "$$HOME/.bash_profile" ]; then \
		ln -sf "$(DOTFILES_DIR)/.bash_profile" $$HOME/.bash_profile; \
		elif [ -f "$$HOME/.bash_profile" ]; then \
			mv $$HOME/.bash_profile $$HOME/.bash_profile.backup; \
			ln -sf "$(DOTFILES_DIR)/.bash_profile" $$HOME/.bash_profile; \
		else \
			ln -sf "$(DOTFILES_DIR)/.bash_profile" $$HOME/.bash_profile; \
	fi
	# .tmux.conf
	@if [ -L "$$HOME/.tmux.conf" ]; then \
		ln -sf "$(DOTFILES_DIR)/.tmux.conf" $$HOME/.tmux.conf; \
	elif [ -f "$$HOME/.tmux.conf" ]; then \
		mv $$HOME/.tmux.conf $$HOME/.tmux.conf.backup; \
		ln -sf "$(DOTFILES_DIR)/.tmux.conf" $$HOME/.tmux.conf; \
	else \
		ln -sf "$(DOTFILES_DIR)/.tmux.conf" $$HOME/.tmux.conf; \
	fi
	# .config
	@if [ -L "$$HOME/.config/nvim" ]; then \
		ln -sf "$(TOOLS_DIR)/nvim" $$HOME/.config/nvim; \
	elif [ -f "$$HOME/.config/nvim" ]; then \
		mv $$HOME/.config/nvim $$HOME/.config/nvim.backup; \
		ln -sf "$(TOOLS_DIR)/nvim" $$HOME/.config/nvim; \
	else \
		ln -sf "$(TOOLS_DIR)/nvim" $$HOME/.config/nvim; \
	fi
	# nvim
	ln -sf "$(TOOLS_DIR)/downloads/neovim/build/bin/nvim" "$(TOOLS_DIR)/bin/nvim"
	# tmux
	ln -sf "$(TOOLS_DIR)/downloads/tmux/tmux" "$(TOOLS_DIR)/bin/tmux"
