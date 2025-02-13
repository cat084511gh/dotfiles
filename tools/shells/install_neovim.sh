# install_neovim.sh

#!/bin/sh

OS=$(uname)
NEOVIM_VERSION="v0.11.0"

cd ../downloads/

if [ ! -d "neovim" ]; then
  git clone https://github.com/neovim/neovim.git
  cd neovim
else
  cd neovim
  git fetch
fi

git checkout $NEOVIM_VERSION

if [ "$OS" = "Linux" ]; then
  if command -v apt-get >/dev/null; then
    sudo apt update
    sudo apt install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl ripgrep node
  elif command -v yum >/dev/null; then
    sudo yum install -y epel-release
    sudo yum install -y ninja-build gettext libtool autoconf automake cmake gcc-c++ pkgconfig unzip curl ripgrep node
  else
    echo "No supported package manager found for Linux"
    exit 1
  fi
elif [ "$OS" = "Darwin" ]; then
  if command -v brew >/dev/null; then
    brew update
    brew install ninja gettext libtool autoconf automake cmake pkg-config unzip curl ripgrep node
  else
    echo "No supported package manager found for macOS"
    exit 1
  fi
else
  echo "Unsupported OS: $OS"
  exit 1
fi

make CMAKE_BUILD_TYPE=Release
sudo make install

PACKER_DIR="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
if [ ! -d "$PACKER_DIR" ]; then
  git clone https://github.com/wbthomason/packer.nvim "$PACKER_DIR"
fi
