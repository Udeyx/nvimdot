local autocmd = vim.api.nvim_create_autocmd

-- Don't auto commenting new lines
autocmd('BufEnter', {
    pattern = '*',
    command = 'set fo-=c fo-=r fo-=o fo-=O',
})

-- Let cursor's shape return to beam after quit nvim
autocmd('VimLeave', {
    pattern = '*',
    command = 'set guicursor=a:ver90',
})
