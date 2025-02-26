# install_neovim.sh
#!/bin/sh

OS=$(uname)

cd ../downloads/

git clone https://github.com/zk-org/zk.git
cd zk
make

mkdir -p ~/memo && cd ~/memo
zk init
