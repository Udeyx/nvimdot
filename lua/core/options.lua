local opt = vim.opt
local g = vim.g
-- file options
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.autoread = true
opt.hidden = true

-- use filetype.lua instead of filetype.vim to accelerate nvim startup time
g.did_load_filetypes = 0
g.do_filetype_lua = 1

-- encoding
opt.encoding = 'UTF-8'
opt.fileencoding = 'utf-8'

-- line number
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- enable mouse
opt.mouse = 'a'

-- hight the current line
opt.cursorline = true

-- always show sign column
opt.signcolumn = 'yes'

-- tab and indent
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftround = true
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- searching
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- hight of cmd
opt.cmdheight = 2

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap = '<>[]hl'

-- interval for updating, also used for CursorHold autocommands
opt.updatetime = 100

-- timeout length of continuous type
opt.timeoutlen = 400

-- location of split window
opt.splitbelow = true
opt.splitright = true

-- enable 24-bit color in TUI
opt.termguicolors = true

-- disable nvim intro
opt.shortmess:append 'sI'

-- show mode with plugins
opt.showmode = false

-- manage clipboard
opt.clipboard = 'unnamedplus'

-- completion type
opt.completeopt = { 'menuone', 'noselect' }
opt.pumheight = 10
opt.wildmenu = true

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
    'tutor',
    'rplugin',
    'syntax',
    'synmenu',
    'optwin',
    'compiler',
    'bugreport',
    'ftplugin',
}

for _, plugin in pairs(default_plugins) do
    g['loaded_' .. plugin] = 1
end
