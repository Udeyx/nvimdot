local present, null = pcall(require, 'null-ls')
if not present then
    print("can't find null")
    return
end

local options = {
    sources = {
        null.builtins.formatting.stylua,
        null.builtins.formatting.clang_format,
        null.builtins.formatting.prettier.with({
            filetypes = {
                'javascript',
                'css',
                'yaml',
                'json',
                'markdown',
                'typescript',
            },
        }),
        null.builtins.formatting.black.with({ extra_args = { '--fast' } }),
        null.builtins.formatting.rustfmt,
    },
}

null.setup(options)
