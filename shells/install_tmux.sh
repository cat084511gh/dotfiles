#install_neovim.sh

#!/bin/sh

# OS判定
OS=$(uname)
TMUX_VERSION="3.2"

cd ./downloads

if [ ! -d "tmux" ]; then
	git clone https://github.com/tmux/tmux.git
	cd tmux
else
	cd tmux
	git fetch
fi

git checkout $TMUX_VERSION

if [ "$OS" = "Linux" ]; then
	if command -v apt-get > /dev/null; then
		echo "Using apt for Linux"
		sudo apt update
		sudo apt install -y automake build-essential pkg-config libevent-dev libncurses5-dev bison byacc
	elif command -v yum > /dev/null; then
		echo "Using yum for Linux"
		sudo yum install -y automake gcc kernel-devel make ncurses-devel libevent-devel
	elif command -v dnf > /dev/null; then
		echo "Using dnf for Linux"
		sudo dnf install -y automake gcc make ncurses-devel libevent-devel
	else
		echo "No supported package manager found for Linux"
		exit 1
	fi
elif [ "$OS" = "Darwin" ]; then
	if command -v brew > /dev/null; then
		echo "Using Homebrew for macOS"
		brew update
		brew install automake pkg-config libevent ncurses
	elif command -v port > /dev/null; then
		echo "Using MacPorts for macOS"
		sudo port selfupdate
		sudo port install automake pkgconfig libevent ncurses
	else
		echo "No supported package manager found for macOS"
		exit 1
	fi
else
	echo "Unsupported OS: $OS"
	exit 1
fi

sh ./autogen.sh
sh autogen.sh
./configure
make CMAKE_BUILD_TYPE=Release
sudo make install
