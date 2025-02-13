# install_neovim.sh
#!/bin/sh

OS=$(uname)

cd ../downloads/

git clone https://github.com/junegunn/fzf.git
fzf/install
