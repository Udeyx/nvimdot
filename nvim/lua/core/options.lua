local opt = vim.opt
local g = vim.g

-- use filetype.lua instead of filetype.vim
g.did_load_filetypes = 0
g.do_filetype_lua = 1

-- utf8
opt.encoding = 'UTF-8'
opt.fileencoding = 'utf-8'

-- enable confirm question
opt.confirm = true

-- line number
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- hight line
opt.cursorline = true

-- signs on right side
opt.signcolumn = 'yes'

-- tab and indent
opt.tabstop = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftround = true
opt.shiftwidth = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.expandtab = true
opt.autoindent = true
opt.autoindent = true
opt.smartindent = true

-- ignore case while searching
opt.ignorecase = true
opt.smartcase = true

-- no highlight which searching
opt.hlsearch = false

-- search which typing
opt.incsearch = true

-- hight of cmd
opt.cmdheight = 1

-- autoload which changed by other apps
opt.autoread = true
opt.autoread = true

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap = '<>[]hl'

-- hide changed buffer
opt.hidden = true

-- enable mouse
opt.mouse = 'a'

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- timeout length of continuous type
opt.timeoutlen = 400

-- location of split window
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.termguicolors = true

-- enhance command-line completion
opt.wildmenu = true

-- disable nvim intro
opt.shortmess:append('sI')

-- show mode with plugins
opt.showmode = false

-- manage clipboard
opt.clipboard = 'unnamedplus'

-- set the max number of completion sections
opt.pumheight = 10

-- use file type .lua instead of filetype .vim
g.did_load_filetypes = 0
g.do_filetype_lua = 1

-- disable some builtin vim plugins
local default_plugins = {
    '2html_plugin',
    'getscript',
    'getscriptPlugin',
    'gzip',
    'logipat',
    'netrw',
    'netrwPlugin',
    'netrwSettings',
    'netrwFileHandlers',
    'matchit',
    'tar',
    'tarPlugin',
    'rrhelper',
    'spellfile_plugin',
    'vimball',
    'vimballPlugin',
    'zip',
    'zipPlugin',
}
for _, plugin in pairs(default_plugins) do
    g['did_loaded_' .. plugin] = 1
end

-- set leader key
g.mapleader = ' '

-- set colorscheme
vim.cmd([[colorscheme tokyonight]])
