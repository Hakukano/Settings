# Installation

Run install in a clean environment, then install not-installed programs in the Must-have list below

# Must-have list

## git(You should have got this one)

```bash
sudo apt install git
```

## npm

```bash
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install nodejs
```
This should eventually install npm

## nvim

```bash
sudo apt install neovim
sudo apt install python[{2,3}]
sudo apt install python[{2,3}]-pip
pip[{2,3}] install neovim
sudo apt install silversearcher-ag
sudo apt install ripgrep
sudo apt install clang
sudo apt install clang-format
sudo apt install cscope
curl -sSL https://get.haskellstack.org/ | sh
sudo apt install libicu-dev libtinfo-dev libgmp-dev
cd ~/Git
git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules
cd haskell-ide-engine
stack upgrade
stack ./install.hs hie-<latest_version>
stack ./install.hs build-data
nvim
:PlugInstall
:UpdateRemotePlugins
Q
cd ~/.vim/plugged/YouCompleteMe
sudo apt install cmake
sudo apt install openjdk-<latest_version>-jdk
curl --proto '=https' --tlsv<latest_version> -sSf https://sh.rustup.rs | sh
./install.py --clang-completer --java-completer --rust-completer --ts-completer
```

# Optional list

## chromium

```bash
sudo apt install chromium-browser
```

## htop

```bash
sudo apt install htop
```

## gradle

```bash
sudo apt install gradle
```

## qt

```bash
sudo apt install qt5-default
```

## starship

```bash
sudo apt install fonts-firacode
cargo install starship
```
Switch terminal font to fira code

## thefuck

```bash
sudo apt install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck
```

## tldr

```bash
sudo apt install tldr
```

## tmux

```bash
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/Git/tpm
sudo apt install xsel
```

Ctrl-b I to install plugins

Ctrl-b U to update plugins

Ctrl-b alt-u to remove plugins

## tree

```bash
sudo apt install tree
```

## xclip

```bash
sudo apt install xclip
```

# Daily update check

```bash
doall update
cd ~/Git
doall gs
doall gpl
nvim
:PlugUpdate
:UpdateRemotePlugins
Q
```

# Shadowsocks Config

## Server script

```bash
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
sudo chmod a+x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log
```

Or use cached script under ss/

# Outline VPN Config

```bash
sudo wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh | bash
```
