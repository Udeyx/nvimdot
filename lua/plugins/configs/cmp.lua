local present, cmp = pcall(require, 'cmp')
if not present then
    print "can't find cmp"
    return
end

cmp.setup {
    snippet = {
        expand = function(args)
            -- Use luasnip as completion engine
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- Use luasnip as completion source
        { name = 'luasnip' },
    }, { { name = 'buffer' }, { name = 'path' } },{ name = 'cmp_tabnine' }),

    -- 快捷键设置
    mapping = require('core.keybindings').cmp(cmp),
}

-- / 查找模式使用 buffer 源
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})
