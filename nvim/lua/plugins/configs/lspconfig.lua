local lspconfig = require('lspconfig')
require('nvim-lsp-installer').setup()

local servers = {
    sumneko_lua = require('plugins.configs.servers.lua'),
    clangd = require('plugins.configs.servers.c'),
    texlab = require('plugins.configs.servers.latex'),
    pyright = require('plugins.configs.servers.python')
    -- remark_ls = require("lsp.config.markdown"),
}

for name, config in pairs(servers) do
    if config ~= nil and type(config) == 'table' then
        -- 自定义初始化配置文件必须实现on_setup 方法
        config.on_setup(lspconfig[name])
    else
        -- 使用默认参数
        lspconfig[name].setup({})
    end
end
