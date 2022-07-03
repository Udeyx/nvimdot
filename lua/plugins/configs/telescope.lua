local present, telescope = pcall(require, 'telescope')

if not present then
    print "can't find telescope"
    return
end

local options = {
    defaults = {
        mappings = require('core.keybindings').telescope,
    },
}

telescope.setup(options)
