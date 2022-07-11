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

local config = {
    on_attach = function(client, bufnr)
        -- let null-ls do formatting job
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        -- keybindings
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        require('core.keybindings').lsp(buf_set_keymap)
    end,
}
local servers = {
    'sumneko_lua',
    'clangd',
    'texlab',
    'pyright',
    'bashls',
    'jsonls',
    'yamlls',
}

for _, name in pairs(servers) do
    lspconfig[name].setup(config)
end
