local shortcut = {
    {
        desc = '󰊳 Update',
        group = '@property',
        action = 'Lazy update',
        key = 'u',
    },
    {
        desc = ' Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
    },
}
local options = {
    config = {
        week_header = { enable = true },
        shortcut = shortcut,
        packages = { enable = false },
        mru = { limit = 5 },
        footer = {},
    },
}

require('dashboard').setup(options)
