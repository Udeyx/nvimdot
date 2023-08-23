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
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities.offsetEncoding = { 'utf-16' }
    local default_config = {
        capabilities = capabilities,
    }
    return default_config
end
return M
