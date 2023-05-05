local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command
-- Auto Commands
-- Don't auto commenting new lines
autocmd('BufEnter', {
    pattern = '*',
    command = 'set fo-=c fo-=r fo-=o fo-=O',
})
autocmd('VimLeave', {
    pattern = '*',
    command = 'set guicursor=a:ver90',
})
-- Custom commands
