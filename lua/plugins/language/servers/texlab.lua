local options = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = require('core.utils').setup_lsp().on_attach,
    settings = {
        texlab = {
            build = {
                executable = 'tectonic',
                args = {
                    '-X',
                    'compile',
                    '%f',
                    '--synctex',
                    '--keep-logs',
                    '--keep-intermediates',
                },
            },
            chktex = {
                onOpenAndSave = true,
                onEdit = true,
            },
            diagnosticsDelay = 150,
        },
    },
}

return options
