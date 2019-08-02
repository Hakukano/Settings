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

## tldr

```bash
sudo apt install tldr
```

## tmux

```bash
sudo apt install tmux
```

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

## Client Global for Ubuntu

```bash
sudo genpac --proxy="SOCKS5 127.0.0.1:1080" -o autoproxy.pac --gfwlist-url="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"
```
