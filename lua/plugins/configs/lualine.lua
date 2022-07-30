local present, lualine = pcall(require, 'lualine')

if not present then
    print 'lualine not found, please install it'
    return
end

local options = {
    options = {
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_c = {
            'filename',
            {
                'lsp_progress',
                spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
            },
        },
        lualine_x = { 'encoding', 'filetype' },
    },
}

lualine.setup(options)
