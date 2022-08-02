-- Autocommands
local autocmd = vim.api.nvim_create_autocmd

-- Don't auto commenting new lines
autocmd('BufEnter', {
    pattern = '*',
    command = 'set fo-=c fo-=r fo-=o fo-=O',
})
-- Let cursor's shape return to beam after quit nvim
-- autocmd('VimLeave', {
--     pattern = '*',
--     command = 'set guicursor=a:ver90',
-- })

-- Lsp utils
local M = {}

M.on_attach = function(client, bufnr)
    -- Only use null-ls to format files
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    -- keybindings
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    require('core.keybindings').lsp(buf_set_keymap)
end
return M
