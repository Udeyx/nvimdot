local present, lspsaga = pcall(require 'lspsaga')

if not present then
    print "can't find lspsaga"
    return
end

lspsaga.init_lsp_saga {}
