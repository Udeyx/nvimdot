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

local M = {}

M.on_attach = function(client, bufnr)
    -- Only use null-ls to format files
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    -- keybindings
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    require('core.keybindings').lsp(buf_set_keymap)
end

local default_config = { on_attach = M.on_attach }

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
    if name ~= 'clangd' then
        lspconfig[name].setup(config)
    end
end

return M
