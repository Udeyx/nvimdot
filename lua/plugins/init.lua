local plugins = {
    ['nvim-lua/plenary.nvim'] = {},
    ['lewis6991/impatient.nvim'] = {},
    ['wbthomason/packer.nvim'] = {},
    ['dstein64/vim-startuptime'] = {},
    ['famiu/bufdelete.nvim'] = {
        cmd = 'Bdelete',
    },
    ['kyazdani42/nvim-web-devicons'] = {
        after = 'plenary.nvim',
    },
    ['p00f/nvim-ts-rainbow'] = {
        after = 'nvim-treesitter',
    },
    ['arkav/lualine-lsp-progress'] = {
        after = 'nvim-web-devicons',
    },
    ['jbyuki/nabla.nvim'] = {},
    ['navarasu/onedark.nvim'] = {},
    ['folke/tokyonight.nvim'] = {},
    ['glepnir/dashboard-nvim'] = {
        config = function()
            require('plugins.configs.dashboard')
        end,
    },
    ['ellisonleao/glow.nvim'] = {
        cmd = 'Glow',
    },
    ['numToStr/Comment.nvim'] = {
        keys = { 'gc', 'gb' },
        config = function()
            require('plugins.configs.comment')
        end,
    },
    ['akinsho/bufferline.nvim'] = {
        tag = 'v2.*',
        after = 'nvim-web-devicons',
        config = function()
            require('plugins.configs.bufferline')
        end,
    },
    ['nvim-lualine/lualine.nvim'] = {
        after = 'lualine-lsp-progress',
        config = function()
            require('plugins.configs.lualine')
        end,
    },
    ['nvim-treesitter/nvim-treesitter'] = {
        event = { 'BufRead', 'BufNewFile' },
        run = ':TSUpdate',
        config = function()
            require('plugins.configs.treesitter')
        end,
    },
    ['kyazdani42/nvim-tree.lua'] = {
        cmd = { 'NvimTreeToggle' },
        config = function()
            require('plugins.configs.tree')
        end,
    },
    ['nvim-telescope/telescope.nvim'] = {
        cmd = 'Telescope',
        config = function()
            require('plugins.configs.telescope')
        end,
    },
    ['akinsho/toggleterm.nvim'] = {
        cmd = 'ToggleTerm',
        config = function()
            require('plugins.configs.toggleterm')
        end,
    },
    ['CRAG666/code_runner.nvim'] = {
        cmd = 'RunCode',
        config = function()
            require('plugins.configs.runner')
        end,
    },
    ['williamboman/nvim-lsp-installer'] = {},
    ['neovim/nvim-lspconfig'] = {
        config = function()
            require('plugins.configs.lspconfig')
        end,
    },
    ['jose-elias-alvarez/null-ls.nvim'] = {
        config = function()
            require('plugins.configs.null')
        end,
    },
    -- ['tami5/lspsaga.nvim'] = {
    --     config = function()
    --         require('plugins.configs.lspsaga')
    --     end,
    -- },
    -- load complition plugins in insert mode only
    ['rafamadriz/friendly-snippets'] = {
        module = 'cmp_nvim_lsp',
        event = 'InsertEnter',
    },

    ['hrsh7th/nvim-cmp'] = {
        after = 'friendly-snippets',
        config = function()
            require('plugins.configs.cmp')
        end,
    },

    ['L3MON4D3/LuaSnip'] = {
        wants = 'friendly-snippets',
        after = 'nvim-cmp',
        config = function()
            --require("plugins.configs.others").luasnip()
        end,
    },

    ['saadparwaiz1/cmp_luasnip'] = {
        after = 'LuaSnip',
    },

    ['hrsh7th/cmp-nvim-lua'] = {
        after = 'cmp_luasnip',
    },

    ['hrsh7th/cmp-nvim-lsp'] = {
        after = 'cmp-nvim-lua',
    },

    ['hrsh7th/cmp-buffer'] = {
        after = 'cmp-nvim-lsp',
    },

    ['hrsh7th/cmp-path'] = {
        after = 'cmp-buffer',
    },
    ['windwp/nvim-autopairs'] = {
        after = 'nvim-cmp',
        config = function()
            require('plugins.configs.autopairs')
        end,
    },
}

require('core.packer').run(plugins)
