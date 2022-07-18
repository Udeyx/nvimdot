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
        --after = 'nvim-web-devicons',
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
            require 'plugins.configs.comment'
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
    -- Completion
    use { 'rafamadriz/friendly-snippets', event = 'InsertEnter' }
    use {
        'hrsh7th/nvim-cmp',
        after = 'friendly-snippets',
        config = function()
            require 'plugins.configs.cmp'
        end,
    }
    use { 'L3MON4D3/LuaSnip', after = 'nvim-cmp' }
    use { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' }
    use { 'hrsh7th/cmp-nvim-lua', after = 'cmp_luasnip' }
    use { 'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua' }
    use { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-path', after = 'cmp-buffer' }
    use {
        'windwp/nvim-autopairs',
        after = 'cmp-path',
        config = function()
            require 'plugins.configs.autopairs'
        end,
    }
    use {
        'kylechui/nvim-surround',
        after = 'nvim-autopairs',
        config = function()
            require('nvim-surround').setup {
                -- Configuration here, or leave empty to use defaults
            }
        end,
    }
    use { 'tzachar/cmp-tabnine', run = './install.sh', after = 'nvim-surround' }
end

packer.startup(options)
