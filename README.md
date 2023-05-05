# Nvimdot
Udeyx's dotfile for nvim, containing configuration for essential plugins and lsp servers.
## Features:
* Fast  
  Most of the plugins are set to be lazy loaded. The startup time is below 50ms on M1 chip.
* Selected and configured lsp servers  
  A language always has several lsp servers. Thus, it could be troublesome to choose a fit one. In this dotfile, I select some servers as default and configured them, which would provide a good out-of-box experience.
## Installation
### Install dependencies
* You don't need to install the package manager(`lazy.nvim`) manually, since there is a bootstrap function in this dotfile.
* `ripgrep(rg) and fd` for `telescope.nvim` , `make` and a C compiler(`gcc` or `clang`) for building it's native dependencies. 
* `rust` and `cargo` for building `SnipRun`
```shell
# Windwos 
scoop install ripgrep llvm(or gcc) rust
# Archlinux & Manjaro
pacman -S ripgrep fd base-devel rust
# MacOS
brew install ripgrep fd rust
# ......
```
* `wget`, `git`, `pip`, `npm`, ...... for `mason.nvim`
### Clone and setup
After installing these above dependencies, clone this repo to the right directory.
```shell
# Linux/MacOS
git clone --depth 1 https://github.com/Udeyx/nvimdot.git ~/.config/nvim
# Windows
git clone --depth 1 https://githu.com/Udeyx/nvimdot.git ~/Appdata/Local/nvim
```
Finally, you need to restart nvim twice. The first time is to bootstrap `lazy.nvim`. The second time is to let `lazy.nvim` install the plugins.