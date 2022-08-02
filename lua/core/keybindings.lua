-- duplicate parametes
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- plugins' keybindings
local M = {}

-- nvim-tree
keymap('n', '<A-m>', ':NvimTreeToggle<CR>', opts)
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
keymap('n', '<C-h>', ':BufferLineCyclePrev<CR>', opts)
keymap('n', '<C-l>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<C-w>', ':Bdelete!<CR>', opts)

-- telescope
keymap('n', '<C-p>', ':Telescope find_files<CR>', opts)
keymap('n', '<C-f>', ':Telescope live_grep<CR>', opts)
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
keymap('n', 'gh', ':Lspsaga lsp_finder<CR>', opts)
-- Code action
keymap('n', '<leader>ca', ':Lspsaga code_action<CR>', opts)
keymap('v', '<leader>ca', ':<C-U>Lspsaga range_code_action<CR>', opts)
-- Hover doc
keymap('n', 'K', ':Lspsaga hover_doc<CR>', opts)
-- Signature help
keymap('n', 'gs', ':Lspsaga signature_help<CR>', opts)
-- Rename
keymap('n', 'gr', ':Lspsaga rename<CR>', opts)
-- Preview definition
keymap('n', 'gd', ':Lspsaga preview_definition<CR>', opts)
-- Diagnostic
keymap('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', opts)
keymap('n', '[e', ':Lspsaga diagnostic_jump_next<CR>', opts)
keymap('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>', opts)
-- Outline
keymap('n', '<leader>l', ':LSoutlineToggle<CR>', opts)
-- Float terminal
keymap('n', '<leader>t', ':ToggleTerm<CR>i', opts)
keymap('t', '<leader>t', '<C-\\><C-n>:ToggleTerm<CR>', opts)

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
keymap('n', '<leader>r', ':w<CR>:RunCode<CR>', opts)

-- Packer
keymap('n', '<leader>p', ':PackerSync<CR>', opts)

-- Copilot
keymap('i', '<C-a>', "copilot#Accept('\\<CR>')", { silent = true, noremap = true, expr = true })

return M
