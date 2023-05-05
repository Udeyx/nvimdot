local M = {}

M.bootstrap = function()
    print 'installing lazy.nvim, please wait'
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        '--single-branch',
        'https://github.com/folke/lazy.nvim.git',
        vim.fn.stdpath 'data' .. '/lazy/lazy.nvim',
    }
    print 'lazy.nvim was installed, please restart neovim'
end

-- Default configuration for LSP servers
M.setup_lsp = function()
    local lsp_formatting = function(bufnr)
        vim.lsp.buf.format {
            filter = function(client) return client.name == 'null-ls' end,
            bufnr = bufnr,
        }
    end
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    local on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function() lsp_formatting(bufnr) end,
            })
        end
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        require('core.keybindings').lsp(vim.keymap.set, bufopts)
    end
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities.offsetEncoding = { 'utf-16' }
    local default_config = {
        capabilities = capabilities,
        on_attach = on_attach,
    }
    return default_config
end
return M
