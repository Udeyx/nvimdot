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
    sumneko_lua = require 'plugins.configs.servers.lua',
    clangd = require 'plugins.configs.servers.c',
    texlab = require 'plugins.configs.servers.latex',
    pyright = require 'plugins.configs.servers.python',
    bashls = require 'plugins.configs.servers.bash',
    jsonls = require 'plugins.configs.servers.json',
    yamlls = require 'plugins.configs.servers.yaml',
}

for name, config in pairs(servers) do
    if config ~= nil and type(config) == 'table' then
        config.on_setup(lspconfig[name])
    else
        lspconfig[name].setup {}
    end
end
