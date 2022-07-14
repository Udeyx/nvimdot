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
    'jedi_language_server',
    'bashls',
    'jsonls',
    'yamlls',
    'marksman',
}

for _, name in pairs(servers) do
    lspconfig[name].setup(config)
end
