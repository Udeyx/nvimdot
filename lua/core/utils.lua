local M = {}

M.run = function(plugins)
    local present, packer = pcall(require, 'packer')
    if not present then
        print "can't find packer"
        return
    end

    packer.startup {
        function(use)
            for key, _ in pairs(plugins) do
                plugins[key][1] = key
            end
            for _, v in pairs(plugins) do
                use(v)
            end
        end,
    }
end

M.on_attach = function(client, bufnr)
    -- let null-ls do formatting
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    -- keybindings
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    require('core.keybindings').lsp(buf_set_keymap)
end
return M
