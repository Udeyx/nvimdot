local autocmd = vim.api.nvim_create_autocmd

-- Don't auto commenting new lines
autocmd('BufEnter', {
    pattern = '*',
    command = 'set fo-=c fo-=r fo-=o',
})

-- Let cursor's shape return to beam after quit nvim
autocmd('VimLeave', {
    pattern = '*',
    command = 'set guicursor=a:ver90',
})

-- Autocmd for babla
autocmd('CursorHold',{
    pattern = '*md',
    command = "silent! lua require('nabla').popup()",
})
