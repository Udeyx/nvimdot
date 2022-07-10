local present1, lspconfig = pcall(require, 'lspconfig')
local present2, lspinstaller = pcall(require, 'nvim-lsp-installer')

if not present1 then
    print "can't find lspconfig"
    return
end

if not present2 then
    print "can't find lspinstaller"
    return
end

lspinstaller.setup {}

local servers = {
    sumneko_lua = {},
    clangd = {},
    texlab = {},
    pyright = {},
    bashls = {},
    jsonls = {},
    yamlls = {},
}

for name, config in pairs(servers) do
    table.insert(config,require('core.utils').on_attach)
    lspconfig[name].setup(config)
end
