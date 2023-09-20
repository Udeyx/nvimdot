local plugins = {
    -- UI
    -- {
    --     'svrana/neosolarized.nvim',
    --     dependencies = 'tjdevries/colorbuddy.nvim',
    --     config = function() require('neosolarized').setup {} end,
    -- },
    -- {
    --     'rebelot/kanagawa.nvim',
    --     config = function() vim.cmd 'colorscheme kanagawa' end,
    -- },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        config = function() vim.cmd.colorscheme 'catppuccin' end,
    },
    {
        'glepnir/dashboard-nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function() require 'plugins.ui.dashboard' end,
    },
    {
        'akinsho/bufferline.nvim',
        event = { 'BufRead', 'BufNewFile' },
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function() require 'plugins.ui.bufferline' end,
    },
    {
        'nvim-lualine/lualine.nvim',
        event = { 'BufRead', 'BufNewFile' },
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function() require 'plugins.ui.lualine' end,
    },
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufRead', 'BufNewFile' },
        config = function() require('gitsigns').setup() end,
    },
    -- Language Support
    {
        'nvim-treesitter/nvim-treesitter',
        event = { 'BufRead', 'BufNewFile' },
        build = ':TSUpdate',
        dependencies = {
            'RRethy/nvim-treesitter-endwise',
            'windwp/nvim-ts-autotag',
        },
        config = function() require 'plugins.language.treesitter' end,
    },
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        config = function() require('mason').setup {} end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = 'williamboman/mason-lspconfig.nvim',
        event = { 'BufRead', 'BufNewFile' },
        config = function() require 'plugins.language.lspconfig' end,
    },
    {
        'nvimdev/lspsaga.nvim',
        event = 'LspAttach',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function() require('lspsaga').setup {} end,
    },
    {
        'nvimdev/guard.nvim',
        event = { 'BufRead', 'BufNewFile' },
        dependencies = 'nvimdev/guard-collection',
        config = function() require 'plugins.language.guard' end,
    },
    -- Completion
    {
        'L3MON4D3/LuaSnip',
        dependencies = 'rafamadriz/friendly-snippets',
        event = 'InsertEnter',
        config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'onsails/lspkind.nvim',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'windwp/nvim-autopairs',
        },
        event = 'InsertEnter',
        config = function() require 'plugins.completion.cmp' end,
    },
    -- Tools
    {
        'nvim-tree/nvim-tree.lua',
        cmd = 'NvimTreeToggle',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function() require 'plugins.tools.tree' end,
    },
    { 'famiu/bufdelete.nvim', cmd = 'Bdelete' },
    {
        'abecodes/tabout.nvim',
        dependencies = 'nvim-treesitter',
        event = 'InsertEnter',
        config = function() require('tabout').setup() end,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
        },
        cmd = 'Telescope',
        config = function() require 'plugins.tools.telescope' end,
    },
    {
        'numToStr/Comment.nvim',
        event = { 'BufRead', 'BufNewFile' },
        config = function() require('Comment').setup() end,
    },
    {
        'CRAG666/code_runner.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        cmd = { 'RunCode', 'RunFile', 'RunProject' },
        config = function() require 'plugins.tools.runner' end,
    },
    {
        'norcalli/nvim-colorizer.lua',
        event = { 'BufRead', 'BufNewFile' },
        config = function() require('colorizer').setup() end,
    },
    {
        'elkowar/yuck.vim',
        ft = 'yuck',
    },
    {
        'gpanders/nvim-parinfer',
        ft = 'yuck',
    },
}
local options = {
    defaults = { version = '*' },
    concurrency = 8,
    performance = {
        disabled_plugins = {
            '2html_plugin',
            'getscript',
            'getscriptPlugin',
            'gzip',
            'logipat',
            'netrw',
            'netrwPlugin',
            'netrwSettings',
            'netrwFileHandlers',
            'matchit',
            'tar',
            'tarPlugin',
            'rrhelper',
            'spellfile_plugin',
            'vimball',
            'vimballPlugin',
            'zip',
            'zipPlugin',
            'tutor',
            'rplugin',
            'syntax',
            'synmenu',
            'optwin',
            'compiler',
            'bugreport',
            'ftplugin',
        },
    },
}

vim.opt.rtp:prepend(vim.fn.stdpath 'data' .. '/lazy/lazy.nvim')
local present, lazy = pcall(require, 'lazy')
if not present then
    require('core.utils').bootstrap()
else
    lazy.setup(plugins, options)
end
