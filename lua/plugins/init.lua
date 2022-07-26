local present, packer = pcall(require, 'packer')

if not present then
    print "can't find packer"
    return
end

local options = function(use)
    -- Basic
    use 'nvim-lua/plenary.nvim'
    use 'lewis6991/impatient.nvim'
    use 'wbthomason/packer.nvim'
    use 'dstein64/vim-startuptime'

    -- File Operation
    use {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        config = function()
            require 'plugins.configs.telescope'
        end,
    }
    use {
        'kyazdani42/nvim-tree.lua',
        cmd = 'NvimTreeToggle',
        config = function()
            require 'plugins.configs.tree'
        end,
    }
    use { 'famiu/bufdelete.nvim', cmd = 'Bdelete' }

    -- User Interface
    use {
        'folke/tokyonight.nvim',
        config = function()
            require 'plugins.configs.tokyonight'
        end,
    }
    use {
        'glepnir/dashboard-nvim',
        config = function()
            require 'plugins.configs.dashboard'
        end,
    }
    use { 'kyazdani42/nvim-web-devicons', after = 'plenary.nvim' }
    use { 'arkav/lualine-lsp-progress', event = { 'BufRead', 'BufNewFile' } }
    use {
        'akinsho/bufferline.nvim',
        tag = 'v2.*',
        event = { 'BufRead', 'BufNewFile' },
        config = function()
            require 'plugins.configs.bufferline'
        end,
    }
    use {
        'nvim-lualine/lualine.nvim',
        after = 'lualine-lsp-progress',
        config = function()
            require 'plugins.configs.lualine'
        end,
    }

    -- Syntax
    use {
        'nvim-treesitter/nvim-treesitter',
        event = { 'BufRead', 'BufNewFile' },
        run = ':TSUpdate',
        config = function()
            require 'plugins.configs.treesitter'
        end,
    }
    use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }

    -- Widget
    use {
        'numToStr/Comment.nvim',
        keys = { 'gc', 'gb' },
        config = function()
            require('Comment').setup()
        end,
    }
    use {
        'akinsho/toggleterm.nvim',
        cmd = 'ToggleTerm',
        config = function()
            require 'plugins.configs.toggleterm'
        end,
    }
    use {
        'CRAG666/code_runner.nvim',
        cmd = 'RunCode',
        config = function()
            require 'plugins.configs.runner'
        end,
    }

    -- Language Server Protocol
    use { 'williamboman/nvim-lsp-installer' }
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require 'plugins.configs.lspconfig'
        end,
    }
    use {
        'glepnir/lspsaga.nvim',
        branch = 'main',
        config = function()
            require 'plugins.configs.lspsaga'
        end,
    }
    use {
        'onsails/lspkind.nvim',
        config = function()
            require 'plugins.configs.lspkind'
        end,
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require 'plugins.configs.null'
        end,
    }
    use {
        'p00f/clangd_extensions.nvim',
        ft = { 'c', 'cpp' },
        config = function()
            require 'plugins.configs.clangd'
        end,
    }
    -- Completion
    use { 'rafamadriz/friendly-snippets', event = 'InsertEnter' }
    use { 'L3MON4D3/LuaSnip', after = 'friendly-snippets' }
    use {
        'hrsh7th/nvim-cmp',
        after = 'LuaSnip',
        config = function()
            require 'plugins.configs.cmp'
        end,
    }
    use { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' }
    use { 'hrsh7th/cmp-nvim-lsp', after = 'cmp_luasnip' }
    use { 'tzachar/cmp-tabnine', run = 'pwsh ./install.ps1', after = 'cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-nvim-lua', after = 'cmp-tabnine' }
    use { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lua' }
    use { 'hrsh7th/cmp-path', after = 'cmp-buffer' }
    use {
        'windwp/nvim-autopairs',
        after = 'cmp-path',
        config = function()
            require 'plugins.configs.autopairs'
        end,
    }
end

packer.startup(options)
