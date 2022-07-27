local configs = {
    settings = {

        Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = { library = { [vim.fn.expand '$VIMRUNTIME/lua'] = true } },
        },
    },
    on_attach = function(client, bufnr)
        -- Only use null-ls to format files
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        -- keybindings
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        require('core.keybindings').lsp(buf_set_keymap)
    end,
}

return configs
