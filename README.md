# Nvimdot
Udeyx's dotfile for nvim, containing configuration for essential plugins and lsp servers.
## Features:
* Fast  
  Most of the plugins are set to be lazy loaded. The startup time is only 20~50ms on R5-4600H CPU.
* Selected and configured lsp servers  
  Many languages have several servers. Thus, it could be troublesome to choose a fit one. In this dotfile, 
  I select some servers as default and configured them, which would provide a good out-of-box experience.
## Installation
### Install dependencies
* Packer.nvim for installing plugins  
If you use windows
```shell
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```
else
```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
* ripgrep(rg) and fd for telescope.nvim
```shell
# Windwos 
scoop install ripgrep
# Archlinux & Manjaro
pacman -S ripgrep fd
...
```
* wget, git, pip, npm for nvim-lsp-installer
* jedi for jedi-language-server  
  I use jedi-language-server as python's lsp server, since it is fast and reliable. This server is based on the package "jedi". 
  It seems that you may not have it's dependecies installed while using nvim-lsp-installer. So I recommend installing jedi-language-server manually by
  ```python
  pip install jedi-language-server
  ```
* pwsh(Windows)
pwsh is used to run cmp-tabnine's installation script on Windows.
### Clone and setup
After installing these above dependencies, clone this repo to the right directory.
```shell
# Linux
git clone --depth 1 https://github.com/Udeyx/nvimdot.git ~/.config/nvim
# Windows
git clone --depth 1 https://githu.com/Udeyx/nvimdot.git ~/Appdata/Local/nvim
```
After clone this repo, you should type :Packersync command in nvim to install plugins.
