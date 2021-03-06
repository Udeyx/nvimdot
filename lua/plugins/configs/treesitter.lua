local present, treesitter = pcall(require, 'nvim-treesitter.configs')

if not present then
    print 'nvim-treesitter not found, please install it'
    return
end

local options = {
    ensure_installed = {
        'bash',
        'c',
        'cpp',
        'go',
        'java',
        'json',
        'latex',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'rust',
        'vim',
        'yaml',
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
}

treesitter.setup(options)
