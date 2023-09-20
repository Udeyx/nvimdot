require('mason-lspconfig').setup { ensure_installed = { 'lua_ls' } }

local default_config = require('core.utils').setup_lsp()

local servers = {
    bashls = default_config, -- Bash
    cssls = default_config, --CSS
    clangd = default_config, -- C and C++
    gopls = default_config, -- Go
    html = default_config, -- HTML
    jdtls = default_config, -- Java
    vtsls = default_config, -- JavaScript, TypeScript and ...
    jsonls = default_config, -- Json
    texlab = require 'plugins.language.servers.texlab', -- LaTeX
    sumneko_lua = require 'plugins.language.servers.sumneko_lua', -- Lua
    marksman = default_config, -- Markdown
    prismals = default_config, -- Prisma
    pyright = default_config, -- Python
    rust_analyzer = default_config, -- Rust
    sqlls = default_config, -- SQL
    taplo = default_config, -- Toml
    yamlls = default_config, -- Yaml
}

for name, config in pairs(servers) do
    require('lspconfig')[name].setup(config)
end
