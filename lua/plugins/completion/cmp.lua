local cmp = require 'cmp'
cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
require('nvim-autopairs').setup()

cmp.setup {
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end,
    },
    -- keybindings
    mapping = require('core.keybindings').cmp(cmp),
    sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'calc' },
        { name = 'neorg' },
    },
    formatting = {
        format = require('lspkind').cmp_format { mode = 'symbol_text' },
    },
}

-- Use buffer source for '/' and '?'
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})
