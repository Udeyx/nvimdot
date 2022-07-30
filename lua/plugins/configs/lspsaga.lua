local present, lspsaga = pcall(require 'lspsaga')

if not present then
    print 'lspsaga not found, please install it'
    return
end

lspsaga.init_lsp_saga {}
