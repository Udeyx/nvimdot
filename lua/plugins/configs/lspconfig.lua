local present1, lspconfig = pcall(require, 'lspconfig')
local present2, mason = pcall(require, 'mason')
local present3, mason_lspconfig = pcall(require, 'mason-lspconfig')

if not (present1 and present2 and present3) then
    print 'lspconfig or mason not found, please install them'
    return
end

mason.setup {}
mason_lspconfig.setup { ensure_installed = { 'sumneko_lua' } }

local default_config = { on_attach = require('core.utils').on_attach }

local servers = {
    bashls = default_config, -- Bash
    -- clangd, server for C and C++, setup with clang_extensions
    jdtls = default_config, -- Java
    jsonls = default_config, -- Json
    texlab = default_config, -- Latex
    sumneko_lua = require 'plugins.configs.servers.sumneko_lua', -- Lua
    marksman = default_config, -- Markdown
    jedi_language_server = default_config, -- Python pip install jedi-language-server
    yamlls = default_config, -- Yaml
}

for name, config in pairs(servers) do
    lspconfig[name].setup(config)
end
