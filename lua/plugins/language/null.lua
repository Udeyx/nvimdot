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
        null.builtins.formatting.prettier,
        null.builtins.formatting.rustfmt,
        null.builtins.formatting.gofmt,
        null.builtins.formatting.latexindent.with {
            filetypes = { 'tex', 'plaintex', 'bib' },
        },
    },
    -- formatting on save
    on_attach = function(client, bufnr)
        local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
        if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function() vim.lsp.buf.format { bufnr = bufnr } end,
            })
        end
    end,
}

null.setup(options)
