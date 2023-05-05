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
    numberwidth = 2,

    -- enable mouse
    mouse = 'a',

    -- hight the current line
    cursorline = true,

    -- always show tabline
    showtabline = 2,

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
    cmdheight = 1,

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
    vim.opt[k] = v
end
