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
