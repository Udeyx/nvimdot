-- duplicate parametes
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- move fast
map('n', '<C-j>', '5j', opts)
map('n', '<C-k>', '5k', opts)
map('v', '<C-j>', '5j', opts)
map('v', '<C-k>', '5k', opts)

-- easy quit
map('n', 'qq', ':q<CR>', opts)

-- plugins' keybindings
local M = {}

-- nvim-tree
map('n', '<A-m>', ':NvimTreeToggle<CR>', opts)
M.tree = {
    { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
    -- open file with split window
    { key = 'v', action = 'vsplit' },
    { key = 'h', action = 'split' },
    -- change status of hidden files
    { key = '<C-h>', action = 'toggle_dotfiles' }, -- Hide (dotfiles)
    -- file operation
    { key = '<F5>', action = 'refresh' },
    { key = 'a', action = 'create' },
    { key = 'D', action = 'remove' },
    { key = 'r', action = 'rename' },
    { key = 'd', action = 'cut' },
    { key = 'y', action = 'copy' },
    { key = 'p', action = 'paste' },
    { key = 's', action = 'system_open' },
}

-- bufferline
map('n', '<C-h>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<C-l>', ':BufferLineCycleNext<CR>', opts)
map('n', '<C-w>', ':Bdelete!<CR>', opts)

-- telescope
map('n', '<C-p>', ':Telescope find_files<CR>', opts)
map('n', '<C-f>', ':Telescope live_grep<CR>', opts)
M.telescope = {
    i = {
        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
        ['<Down>'] = 'move_selection_next',
        ['<Up>'] = 'move_selection_previous',
        ['<C-n>'] = 'cycle_history_next',
        ['<C-p>'] = 'cycle_history_prev',
        ['<C-c>'] = 'close',
        ['<C-u>'] = 'preview_scrolling_up',
        ['<C-d>'] = 'preview_scrolling_down',
    },
}

-- lsp
M.lsp = function(mapbuf)
    -- Formatting
    mapbuf('n', '<leader>f', ':lua vim.lsp.buf.formatting()<CR>', opts)
end
-- Async lsp finder
map('n', 'gh', ':Lspsaga lsp_finder<CR>', opts)
-- Code action
map('n', '<leader>ca', ':Lspsaga code_action<CR>', opts)
map('v', '<leader>ca', ':<C-U>Lspsaga range_code_action<CR>', opts)
-- Hover doc
map('n', 'K', ':Lspsaga hover_doc<CR>', opts)
-- Signature help
map('n', 'gs', ':Lspsaga signature_help<CR>', opts)
-- Rename
map('n', 'gr', ':Lspsaga rename<CR>', opts)
-- Preview definition
map('n', 'gd', ':Lspsaga preview_definition<CR>', opts)
-- Diagnostic
map('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', opts)
map('n', '[e', ':Lspsaga diagnostic_jump_next<CR>', opts)
map('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>', opts)
-- Outline
map('n', '<leader>l', ':LSoutlineToggle<CR>', opts)
-- Float terminal
map('n', '<leader>t', ':ToggleTerm<CR>i', opts)
map('t', '<leader>t', '<C-\\><C-n>:ToggleTerm<CR>', opts)

M.cmp = function(cmp)
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
    end
    local luasnip = require 'luasnip'
    return {
        -- Confire the completion choice
        ['<CR>'] = cmp.mapping.confirm { select = false },
        -- Super Tab
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }
end

-- Code Runner
map('n', '<leader>r', ':w<CR>:RunCode<CR>', opts)

-- Packer
map('n', '<leader>p', ':PackerSync<CR>', opts)

-- Copilot
vim.cmd[[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]

return M
