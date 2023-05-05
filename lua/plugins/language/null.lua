require('mason-null-ls').setup {
    ensure_installed = { 'stylua' },
}
local null = require 'null-ls'

local options = {
    sources = {
        -- formatting
        null.builtins.formatting.stylua,
        null.builtins.formatting.clang_format,
        null.builtins.formatting.autopep8,
        null.builtins.formatting.prettierd,
        null.builtins.formatting.rustfmt,
        null.builtins.formatting.gofmt,
        null.builtins.formatting.latexindent.with {
            filetypes = { 'tex', 'plaintex', 'bib' },
        },
    },
}

null.setup(options)
