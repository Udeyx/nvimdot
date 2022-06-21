local present, onedark = pcall(require,'onedark')

if not present then
    print('can\'t find onedark')
    return
end

local options = {
    transparent = true;
}

onedark.setup(options)
vim.cmd[[colorscheme onedark]]
