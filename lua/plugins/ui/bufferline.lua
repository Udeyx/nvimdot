local options = {
    options = {
        close_command = 'Bdelete! %d',
        right_mouse_command = nil,
        left_mouse_command = nil,
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = true,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match 'error' and ' ' or ' '
            return ' ' .. icon .. count
        end,
        persist_buffer_sort = false,
        separator_style = 'thin',
    },
}

require('bufferline').setup(options)
