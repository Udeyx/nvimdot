-- duplicate parametes
local keymap = function(mode, keys, operation) vim.keymap.set(mode, keys, operation, { noremap = true, silent = true }) end

-- set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- plugins' keybindings
local M = {}

-- nvim-tree
keymap('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
M.tree = function(api, opts)
    keymap('n', '<CR>', api.node.open.edit, opts 'Open')
    keymap('n', 'o', api.node.open.edit, opts 'Open')
    keymap('n', '<2-LeftMouse>', api.node.open.edit, opts 'Open')
    keymap('n', 'v', api.node.open.vertical, opts 'Open: Vertical Split')
    keymap('n', 'h', api.node.open.horizontal, opts 'Open: Horizontal Split')
    keymap('n', '<C-h>', api.tree.toggle_hidden_filter, opts 'Toggle Dotfiles')
    keymap('n', '<F5>', api.tree.reload, opts 'Refresh')
    keymap('n', 'a', api.fs.create, opts 'Create')
    keymap('n', 'x', api.fs.remove, opts 'Delete')
    keymap('n', 'r', api.fs.rename, opts 'Rename')
    keymap('n', 'd', api.fs.cut, opts 'Cut')
    keymap('n', 'y', api.fs.copy.node, opts 'Copy')
    keymap('n', 'p', api.fs.paste, opts 'Paste')
end

-- bufferline
keymap('n', '<C-h>', '<cmd>BufferLineCyclePrev<CR>')
keymap('n', '<C-l>', '<cmd>BufferLineCycleNext<CR>')
keymap('n', '<C-w>', '<cmd>Bdelete!<CR>')

-- telescope
keymap('n', '<C-p>', '<cmd>Telescope find_files<CR>')
keymap('n', '<C-f>', '<cmd>Telescope live_grep<CR>')
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
-- Formatting
M.lsp = function(mapbuf, bufopts)
    mapbuf('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Lsp finder
keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>')
-- Code action
keymap({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>')
-- Rename
keymap('n', 'gr', '<cmd>Lspsaga rename<CR>')
-- Peek definition
keymap('n', 'gd', '<cmd>Lspsaga peek_definition<CR>')
-- Diagnostic
keymap('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>')
keymap('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>')
keymap('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>')
keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
-- Outline
keymap('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
-- Hover doc
keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
-- Callhierarchy
keymap('n', '<Leader>ci', '<cmd>Lspsaga incoming_calls<CR>')
keymap('n', '<Leader>co', '<cmd>Lspsaga outgoing_calls<CR>')
-- Float terminal
keymap({ 'n', 't' }, '<leader>t', '<cmd>Lspsaga term_toggle<CR>')

M.cmp = function(cmp)
    return {
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm { select = false },
    }
end

-- Code Runner
keymap('n', '<leader>r', '<cmd>RunCode<CR>')

return M
