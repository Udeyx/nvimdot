local present, null = pcall(require, 'null-ls')

if not present then
    print("can't find null-ls")
    return
end

local options = {
    sources = {
        null.builtins.formatting.stylua,
        null.builtins.formatting.prettier,
        null.builtins.formatting.clang_format,
        null.builtins.formatting.autopep8,
    }
}

null.setup(options)
