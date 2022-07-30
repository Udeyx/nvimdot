local present, null = pcall(require, 'null-ls')

if not present then
    print 'null-ls not found, please install it'
    return
end

local options = {
    sources = {
        null.builtins.formatting.stylua,
        null.builtins.formatting.prettier,
        null.builtins.formatting.clang_format,
        null.builtins.formatting.black,
    },
}

null.setup(options)
