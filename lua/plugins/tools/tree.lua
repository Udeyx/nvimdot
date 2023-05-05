local function on_attach(bufnr)
    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    require('core.keybindings').tree(require 'nvim-tree.api', opts)
end

local options = {
    disable_netrw = true,
    on_attach = on_attach,
    actions = {
        open_file = {
            quit_on_open = true,
            resize_window = true,
        },
    },
}

require('nvim-tree').setup(options)
