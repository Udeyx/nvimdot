local present, tree = pcall(require, 'nvim-tree')

if not present then
    print "can't find tree"
    return
end

local options = {
    view = {
        width = 30,
        mappings = {
            custom_only = false,
            list = require('core.keybindings').tree,
        },
    },
    git = {
        enable = false,
    },
    actions = {
        open_file = {
            quit_on_open = true,
            resize_window = true,
        },
    },
}

tree.setup(options)
