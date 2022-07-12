-- duplicate parametes
local vim = vim
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- move fast
map('n', '<C-j>', '5j', opt)
map('n', '<C-k>', '5k', opt)
map('n', '<C-u>', '10k', opt)
map('n', '<C-d>', '10j', opt)
map('v', '<C-j>', '5j', opt)
map('v', '<C-k>', '5k', opt)
map('v', '<C-u>', '10k', opt)
map('v', '<C-d>', '10j', opt)

-- easy quit
map('n', 'qq', ':q<CR>', opt)

-- plugins' keybindings
local M = {}

-- nvim-tree
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)
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
map('n', '<C-h>', ':BufferLineCyclePrev<CR>', opt)
map('n', '<C-l>', ':BufferLineCycleNext<CR>', opt)
map('n', '<C-w>', ':Bdelete!<CR>', opt)

-- telescope
map('n', '<C-p>', ':Telescope find_files<CR>', opt)
map('n', '<C-f>', ':Telescope live_grep<CR>', opt)
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
    mapbuf('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', opt)
    -- code action
    mapbuf('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', opt)
    -- go xx
    mapbuf("n", "gd", ":Lspsaga preview_definition<CR>", opt)
    mapbuf('n', 'gh', ':lua vim.lsp.buf.hover()<CR>', opt)
    mapbuf('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opt)
    mapbuf('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opt)
    mapbuf('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opt)
    -- diagnostic
    mapbuf('n', 'gp', ':lua vim.diagnostic.open_float()<CR>', opt)
    mapbuf('n', 'gk', ':lua vim.diagnostic.goto_prev()<CR>', opt)
    mapbuf('n', 'gj', ':lua vim.diagnostic.goto_next()<CR>', opt)
    mapbuf('n', '<leader>f', ':lua vim.lsp.buf.formatting()<CR>', opt)
end

M.cmp = function(cmp)
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
    end
    local luasnip = require 'luasnip'
    return {
        -- show completion tips
        ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- hide completion tips
        ['<A-,>'] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        -- jump to the above tip
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        -- jump to the below tip
        ['<C-j>'] = cmp.mapping.select_next_item(),
        -- confirm your selection
        ['<CR>'] = cmp.mapping.confirm {
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        },
        -- moving fast in the completion menu
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
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
        -- end of super Tab
    }
end

-- Toggleterm
map('n', '<leader>t', ':ToggleTerm<CR>', opt)

-- Code Runner
map('n', '<leader>r', ':w<CR>:RunCode<CR>', opt)

-- Comment
--map('n','<leader>/',function()require("Comment.api").toggle_current_linewise()end,opt)
map('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opt)

-- Packer
map('n', '<leader>p', ':PackerSync<CR>', opt)

return M
