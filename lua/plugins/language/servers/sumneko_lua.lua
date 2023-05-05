local options = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = { library = { [vim.fn.expand '$VIMRUNTIME/lua'] = true } },
        },
    },
    on_attach = require('core.utils').setup_lsp().on_attach,
}

return options
