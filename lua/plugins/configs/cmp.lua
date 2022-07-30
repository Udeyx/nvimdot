local present, cmp = pcall(require, 'cmp')
if not present then
    print 'cmp not found, please install it'
    return
end

cmp.setup {
    snippet = {
        expand = function(args)
            -- Use luasnip as completion engine
            require('luasnip').lsp_expand(args.body)
        end,
    },
    -- keybindings
    mapping = require('core.keybindings').cmp(cmp),
    sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'cmp_tabnine' },
    },
    formatting = require('plugins.configs.lspkind').formatting,
}

-- Use buffer source for '/'
cmp.setup.cmdline('/', {
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
