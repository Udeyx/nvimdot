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

local default_config = { on_attach = require('core.utils').on_attach }

local servers = {
    bashls = default_config, -- Bash
    -- clangd, server for C and C++, setup with clang_extensions
    jdtls = default_config, -- Java
    jsonls = default_config, -- Json
    texlab = default_config, -- Latex
    sumneko_lua = require 'plugins.configs.servers.sumneko_lua', -- Lua
    marksman = default_config, -- Markdown
    jedi_language_server = default_config, -- Python
    yamlls = default_config, -- Yaml
}

for name, config in pairs(servers) do
    lspconfig[name].setup(config)
end
