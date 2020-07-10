Table of Contents
=================

   * [Arch](#arch)
      * [Preinstallation](#preinstallation)
      * [i3](#i3)
   * [Installation](#installation)
   * [Must-have list](#must-have-list)
      * [git](#git)
      * [zsh](#zsh)
      * [npm](#npm)
      * [nvim](#nvim)
   * [Optional list](#optional-list)
      * [chromium](#chromium)
      * [edex-ui](#edex-ui)
      * [gradle](#gradle)
      * [htop](#htop)
      * [ibus](#ibus)
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

# Arch

Follow the Installation guide on https://wiki.archlinux.org/index.php/Installation_guide

## Preinstallation

### During guide

```sh
pacstrap /mnt base linux linux-firmware vim net-tools netctl
```

### After guide su

```sh
echo -e "Interface=XXX\nConnection=ethernet\nIP=static\nAddress=('XXX.XXX.XXX.XXX/XX')\nGateway='XXX.XXX.XXX.XXX'\nDNS=('XXX.XXX.XXX.XXX')" > /etc/netctl/ethernet_static
chmod +r /etc/netctl/ethernet_static
netctl start ethernet_static
netctl enable ethernet_static
pacman --noconfirm -S sudo
groupadd sudo
useradd -m XXX
passwd XXX
usermod -aG sudo XXX
visudo
uncomment %sudo & append XXX ALL=(ALL) NOPASSWD:ALL
exit
```

### In the user

``` sh
sudo pacman --noconfirm -Syu
sudo pacman --noconfirm -S --needed base-devel git
mkdir ~/Git
cd ~/Git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si
yay --noconfirm -S snapd
sudo systemctl start snapd.service
sudo systemctl enable snapd.service
sudo ln -s /var/lib/snapd/snap /snap
sudo pacman --noconfirm -S openssh
ssh-keygen
sudo ssh-keygen -A
```

## i3

```sh
sudo pacman --noconfirm -S i3 rofi xorg-server xorg-xinit rxvt-unicode bind picom noto-fonts-cjk noto-fonts-emoji noto-fonts feh alsa-utils scrot imagemagick util-linux
yay --noconfirm -S polybar ttf-freefont ttf-ms-fonts ttf-linux-libertine ttf-dejavu ttf-inconsolata ttf-ubuntu-font-family i3lock-fancy-git i3lock-color-git
fc-cache
```

# Installation

At least have a ~/Git directory and all git repo goes in it.

Run install.\* in a clean environment, then install not-installed programs in the Must-have list below

# Must-have list

## git

### pacman

```sh
sudo pacman --noconfirm -S git
```

### apt

```sh
sudo apt install -y git
```

## zsh

### pacman

```sh
sudo pacman --noconfirm -S zsh stow
chsh -s /bin/zsh
```

### apt

```sh
sudo apt install -y zsh
chsh -s /bin/zsh
sudo apt install -y stow
fc-cache -vf ~/.font/
```
Reboot && Change terminal font to Hack

## npm

### pacman

```sh
sudo pacman --noconfirm -S nodejs npm
```

### apt

```sh
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y nodejs
```
This should eventually install npm

## nvim

### pacman

```sh
sudo snap install --beta nvim --classic
sudo pacman --noconfirm -S python python-pip python2 python2-pip the_silver_searcher clang cscope cmake jdk11-openjdk stack
pip[{2,3}] install neovim
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cd ~/Git
git clone https://github.com/BurntSushi/ripgrep
cd ripgrep
cargo build --release --features 'pcre2'
sudo cp target/release/rg /bin/rg
cd /tmp
yay -G haskell-ide-engine
cd haskell-ide-engine
edit PKGBUILD to select a version
makepkg --noconfirm -si
nvim
:PlugInstall
:UpdateRemotePlugins
Q
cd ~/.vim/plugged/YouCompleteMe
./install.py --clang-completer --java-completer --rust-completer --ts-completer
~/.fzf/install
source ~/.zshrc
```

### apt

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

# Optional list

## chromium

### pacman

```sh
sudo pacman --noconfirm -S chromium
```

### apt

```sh
sudo apt install -y chromium-browser
```

## edex-ui

### pacman

```sh
yay -S edex-ui
```

## docker

### pacman

```sh
sudo pacman --noconfirm -S docker docker-compose
```

### apt

```sh
sudo apt install -y docker
```

## gradle

### pacman

```sh
sudo pacman --noconfirm -S gradle
```

### apt

```sh
sudo apt install -y gradle
```

## htop

### pacman

```sh
sudo pacman --noconfirm -S htop
```

### apt

```sh
sudo apt install -y htop
```

## ibus

### pacman

```sh
sudo pacman --noconfirm -S ibus ibus-rime
yay --noconfirm -S ibus-mozc
```

## opengl

### pacman

```sh
sudo pacman --noconfirm -S mesa glew sdl2 sdl2_image glm freetype2 freeglut
```

### apt

```sh
sudo apt install libglu1-mesa-dev freeglut3-dev mesa-common-dev libglew-dev libglm-dev
```

## neofetch

### pacman

```sh
sudo pacman --noconfirm -S neofetch
```

### apt

```sh
sudo apt install -y neofetch
```

## qt

```sh
sudo apt install -y qt5-default
```

## sfml

### pacman

```sh
sudo pacman --noconfirm -S sfml
```

### apt

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

### pacman

```sh
sudo pip3 install thefuck
```

### apt

```sh
sudo apt install -y python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck
```

## tldr

### pacman

```sh
sudo pacman --noconfirm -S tldr
```

### apt

```sh
sudo apt install -y tldr
```

## tmux

### pacman

```sh
sudo pacman --noconfirm -S tmux xsel
cd ~/Git
git clone https://github.com/tmux-plugins/tpm
```

### apt

```sh
sudo apt install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/Git/tpm
sudo apt install -y xsel
```

Ctrl-b I to install plugins

Ctrl-b U to update plugins

Ctrl-b alt-u to remove plugins

## tree

### pacman

```sh
sudo pacman --noconfirm -S tree
```

### apt

```sh
sudo apt install -y tree
```

## xclip

### pacman

```sh
sudo pacman --noconfirm -S xclip
```

### apt

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
