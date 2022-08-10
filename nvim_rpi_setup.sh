#!/bin/sh
# Boris Nimcevic
# 2021 December 05

# install prerequisities
sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

# prep to install python3.8
sudo apt-get install -y build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev

# get and install python3
wget https://www.python.org/ftp/python/3.10.1/Python-3.10.1.tar.xz
tar xf Python-3.10.1.tar.xz
cd Python-3.10.1
./configure --enable-optimizations --prefix=/usr
make
sudo make altinstall
# clean after build
cd ..
sudo rm -r Python-3.10.1
rm Python-3.10.1.tar.xz
. ~/.bashrc

# make python3.8 a default python
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1

# make sure pip is setup
export PATH="/usr/bin/pip:$PATH"
/usr/bin/python -m pip install --upgrade pip

# add support for python in neovim
pip intall pynvim

# clone and install
git clone https://github.com/neovim/neovim
cd neovim
rm -r build/  # clear the CMake cache
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install
export PATH="$HOME/neovim/bin:$PATH"

sudo apt install -y clang
sudo apt install -y ripgrep
sudo apt install -y perl

# add it as a main editor
echo "export EDITOR=\"nvim\"" >> $HOME/.bash_profile

# make alias
echo "alias v=\"nvim\"" >> $HOME/.bashrc

# TODO: check if the dotfiles already exist
# if not clone from git dotfiles
# but for now...
cd
mkdir .config
cd .config
git clone https://github.com/borisnimcevic/nvim.git

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# PlugInstall, TSUpdate, TSInstall c,cpp,lua
# Install python
