local present, autopairs = pcall(require, 'nvim-autopairs')

if not present then
    vim.notify('can\t find autopairs')
    return
end

autopairs.setup()
