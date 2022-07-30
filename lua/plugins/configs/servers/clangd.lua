local vim = vim
local present, clangd_extensions = pcall(require, 'clangd_extensions')

if not present then
    print 'clangd_extensions not found, please install it'
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { 'utf-16' }

clangd_extensions.setup {
    server = {
        capabilities = capabilities,
        on_attach = require('core.utils').on_attach,
    },
}
