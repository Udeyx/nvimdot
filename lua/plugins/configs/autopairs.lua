local present, autopairs = pcall(require, 'nvim-autopairs')

if not present then
    print "can't find autopairs"
    return
end

autopairs.setup()
