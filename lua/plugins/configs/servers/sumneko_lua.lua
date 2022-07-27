local configs = {
    settings = {

        Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = { library = { [vim.fn.expand '$VIMRUNTIME/lua'] = true } },
        },
    },
    on_attach = require('core.utils').on_attach,
}

return configs
