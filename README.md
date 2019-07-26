# Installation

Run install in a clean environment, then install not-installed programs in the Must-have list below

# Must-have list

## git(You should have got this one)

```bash
sudo apt install git
```

## npm

```bash
sudo apt install npm
```

## nvim

```bash
sudo apt install neovim
sudo apt install python[{2,3}]
sudo apt install python[{2,3}]-pip
pip[{2,3}] install neovim
sudo apt install silversearcher-ag
sudo apt install ripgrep
sudo apt install clang-format
sudo apt install haskell-stack
sudo apt install libicu-dev libtinfo-dev libgmp-dev
cd ~/Git
git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules
cd haskell-ide-engine
stack upgrade
stack ./install.hs hie-8.6.4
stack ./install.hs build-data
nvim
:PlugInstall
:UpdateRemotePlugins
Q
cd ~/.vim/plugged/YouCompleteMe
sudo apt install cscope
sudo apt install cmake
sudo apt install openjdk-13-jdk
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
./install.py --clang-completer --java-completer --rust-completer --ts-completer
```

# Optional list

## gradle

```bash
sudo apt install gradle
```

## qt

```bash
sudo apt install qt5-default
```

## tmux

```bash
sudo apt install tmux
```

# Daily update check

```bash
doall apt
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
