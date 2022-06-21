local present, bufferline = pcall(require, 'bufferline')

if not present then
    vim.notify("can't find bufferline")
    return
end

local options = {
    options = {
        close_command = 'Bdelete! %d',
        right_mouse_command = nil,
        left_mouse_command = nil,
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return ' ' .. count .. ' '
        end,
        offsets = { filetype = 'NvimTree', text = 'File Explorer' },
        persist_buffer_sort = false,
        separator_style = 'thin',
    },
}

bufferline.setup(options)
