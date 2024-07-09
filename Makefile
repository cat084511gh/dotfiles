.DEFAULT_GOAL := all
DOTFILES_DIR := $$PWD

sample:
	echo $(DOTFILES_DIR)

all: create_dirs deps links

create_dirs:
	mkdir -p ./downloads ./bin $$HOME/.config

deps: create_dirs
	@if [ ! -f "./bin/tmux" ]; then \
		./shells/install_tmux.sh; \
	fi
	@if [ ! -f "./bin/nvim" ]; then \
		./shells/install_neovim.sh; \
	fi

links:
	# .bashrc
	@if [ -L "$$HOME/.bashrc" ]; then \
		ln -sf "$(DOTFILES_DIR)/.bashrc" $$HOME/.bashrc; \
		elif [ -f "$$HOME/.bashrc" ]; then \
			mv $$HOME/.bashrc $$HOME/.bashrc.backup; \
			ln -sf "$(DOTFILES_DIR)/.bashrc" $$HOME/.bashrc; \
		else \
			ln -sf "$(DOTFILES_DIR)/.bashrc" $$HOME/.bashrc; \
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
		ln -sf "$(DOTFILES_DIR)/nvim" $$HOME/.config/nvim; \
	elif [ -f "$$HOME/.config/nvim" ]; then \
		mv $$HOME/.config/nvim $$HOME/.config/nvim.backup; \
		ln -sf "$(DOTFILES_DIR)/nvim" $$HOME/.config/nvim; \
	else \
		ln -sf "$(DOTFILES_DIR)/nvim" $$HOME/.config/nvim; \
	fi
	# nvim
	ln -sf "$(DOTFILES_DIR)/downloads/neovim/build/bin/nvim" "$(DOTFILES_DIR)/bin/nvim"
	# tmux
	ln -sf "$(DOTFILES_DIR)/downloads/tmux/tmux" "$(DOTFILES_DIR)/bin/tmux"
