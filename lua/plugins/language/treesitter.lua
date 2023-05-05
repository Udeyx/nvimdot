local options = {
    ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'html',
        'java',
        'javascript',
        'json',
        'latex',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'regex',
        'scss',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'yaml',
    },
    highlight = { enable = true },
    autotag = { enable = true },
    endwise = { enable = true },
    rainbow = {
        enable = true,
        query = 'rainbow-parens',
        strategy = require('ts-rainbow').strategy.global,
    },
}

require('nvim-treesitter.configs').setup(options)
