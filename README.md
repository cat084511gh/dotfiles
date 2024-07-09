# Summary
This repository is for setting up the cat0 environment.


### Install
  - nvim
  - tmux
### Setup
  - .bashrc
  - .config/nvim
  - .tmux.conf

# Quick Start
1. `git clone git@github.com:cat084511gh/dotfiles.git`
2. `cd dotfiles`
3. `make`

# How to Apply your own bashrc
1. `touch dotfiles/bashrc_load/.bashrc.sample`
2. write your own settings for .bashrc.sample. this dotfiles can load .`bashrc.*`
3. `source ~/.bashrc`

# Key Config
### tmux
- prefix
  `Ctrl + a`
- split pane vertically
  prefix + `\`
- split pane horizontally
  prefix + `-`
- move next pane
  `Ctrl + o`
- resize pane (left)
  prefix + `H`
- resize pane (under)
  prefix + `J`
- resize pane (up)
  prefix + `K`
- resize pane (right)
  prefix + `L`
- maximize pane
  `Ctrl + z`
- change window (left)
  `Shift + left`
- change window (right)
  `Shift + right`
- reload tmux settings
  prefix + `r`

### nvim
- please check `dotfiles/nvim/lua/keymap.lua`
