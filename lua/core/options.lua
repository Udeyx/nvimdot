local opt = vim.opt
local g = vim.g
local options = {
    -- file options
    backup = false,
    swapfile = false,
    writebackup = false,
    autoread = true,
    hidden = true,

    -- encoding
    encoding = 'UTF-8',
    fileencoding = 'utf-8',

    -- line number
    number = true,
    relativenumber = true,
    numberwidth = 2,

    -- enable mouse
    mouse = 'a',

    -- hight the current line
    cursorline = true,

    -- always show sign column
    signcolumn = 'yes',

    -- tab and indent
    tabstop = 4,
    softtabstop = 4,
    shiftround = true,
    shiftwidth = 4,
    expandtab = true,
    autoindent = true,
    smartindent = true,

    -- searching
    ignorecase = true,
    smartcase = true,
    hlsearch = false,
    incsearch = true,

    -- hight of cmd
    cmdheight = 2,

    -- go to previous/next line with h,l,left arrow and right arrow
    -- when cursor reaches end/beginning of line
    whichwrap = '<>[]hl',

    -- interval for updating, also used for CursorHold autocommands
    updatetime = 100,

    -- timeout length of continuous type
    timeoutlen = 400,

    -- location of split window
    splitbelow = true,
    splitright = true,

    -- enable 24-bit color in TUI
    termguicolors = true,

    -- show mode with plugins
    showmode = false,

    -- manage clipboard
    clipboard = 'unnamedplus',

    -- completion type
    completeopt = { 'menuone', 'noselect' },
    pumheight = 10,
    wildmenu = true,
}
for k, v in pairs(options) do
    opt[k] = v
end

-- use filetype.lua instead of filetype.vim to accelerate nvim startup time
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
