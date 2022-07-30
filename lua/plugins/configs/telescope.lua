local present, telescope = pcall(require, 'telescope')

if not present then
    print 'telescope not found, please install it'
    return
end

local options = {
    defaults = {
        mappings = require('core.keybindings').telescope,
    },
}

telescope.setup(options)
