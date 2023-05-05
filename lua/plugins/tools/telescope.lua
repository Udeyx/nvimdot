local telescope = require 'telescope'

local options = {
    defaults = {
        mappings = require('core.keybindings').telescope,
    },
}

telescope.setup(options)
telescope.load_extension 'fzf'
