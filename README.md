Table of Contents
=================

   * [Installation](#installation)
   * [Must-have list](#must-have-list)
      * [git](#git)
      * [npm](#npm)
      * [nvim](#nvim)
      * [zsh](#zsh)
   * [Optional list](#optional-list)
      * [chromium](#chromium)
      * [htop](#htop)
      * [gradle](#gradle)
      * [opengl](#opengl)
      * [qt](#qt)
      * [sfml](#sfml)
      * [starship](#starship)
      * [thefuck](#thefuck)
      * [tldr](#tldr)
      * [tmux](#tmux)
      * [tree](#tree)
      * [xclip](#xclip)
   * [Daily update check](#daily-update-check)
   * [Shadowsocks Config](#shadowsocks-config)
      * [Server script](#server-script)
   * [Outline VPN Config](#outline-vpn-config)

# Installation

At least have a ~/Git directory and all git repo goes in it.

Run install.\* in a clean environment, then install not-installed programs in the Must-have list below

# Must-have list

## git

```sh
sudo apt install -y git
```

## npm

```sh
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y nodejs
```
This should eventually install npm

## nvim

```sh
sudo snap install --beta nvim --classic
sudo apt install -y python[{2,3}]
sudo apt install -y python[{2,3}]-pip
pip[{2,3}] install neovim
sudo apt install -y silversearcher-ag
curl --proto '=https' --tlsv<latest_version> -sSf https://sh.rustup.rs | sh
cd ~/Git
git clone https://github.com/BurntSushi/ripgrep
cd ripgrep
cargo build --release --features 'pcre2'
sudo cp target/release/rg /bin/rg
sudo apt install -y clang
sudo apt install -y clang-format
sudo apt install -y cscope
curl -sSL https://get.haskellstack.org/ | sh
sudo apt install -y libicu-dev libtinfo-dev libgmp-dev
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
sudo apt install -y cmake
sudo apt install -y openjdk-<latest_version>-jdk
./install.py --clang-completer --java-completer --rust-completer --ts-completer
```

## zsh

```sh
sudo apt install -y zsh
chsh -s /bin/zsh
sudo apt install -y stow
fc-cache -vf ~/.font/
```
Reboot && Change terminal font to Hack

# Optional list

## chromium

```sh
sudo apt install -y chromium-browser
```

## docker

```sh
sudo apt install -y docker
```

## htop

```sh
sudo apt install -y htop
```

## gradle

```sh
sudo apt install -y gradle
```

## opengl

```sh
sudo apt install libglu1-mesa-dev freeglut3-dev mesa-common-dev
```

## neofetch

```sh
sudo apt install -y neofetch
```

## qt

```sh
sudo apt install -y qt5-default
```

## sfml

```sh
sudo apt install libsfml-dev
```

## starship

```sh
sudo apt install -y fonts-firacode
cargo install starship
```
Switch terminal font to fira code

## thefuck

```sh
sudo apt install -y python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck
```

## tldr

```sh
sudo apt install -y tldr
```

## tmux

```sh
sudo apt install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/Git/tpm
sudo apt install -y xsel
```

Ctrl-b I to install plugins

Ctrl-b U to update plugins

Ctrl-b alt-u to remove plugins

## tree

```sh
sudo apt install -y tree
```

## xclip

```sh
sudo apt install -y xclip
```

# Daily update check

```sh
doall update
```

# Shadowsocks Config

## Server script

```sh
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
sudo chmod a+x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log
```

Or use cached script under ss/

# Outline VPN Config

```sh
sudo wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh | bash
```
