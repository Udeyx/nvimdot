return {
	on_setup = function(server)
		server.setup({
            filetypes = {
                'latex',
                'plaintex',
            },
			flags = {
				debounce_text_changes = 150,
			},
			on_attach = function(client, bufnr)
				-- 禁用格式化功能，交给专门插件插件处理
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
				-- 绑定快捷键
				local function buf_set_keymap(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end
				require("core.keybindings").lsp(buf_set_keymap)
			end,
		})
	end,
}
