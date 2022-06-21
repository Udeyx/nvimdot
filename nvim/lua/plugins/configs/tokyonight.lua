local present, tokyonight = pcall(require,'tokyonight')

if not present then
    print('can\'t find tokyonight')
    return
end

local options = {
    transparent = true,
}
tokyonight.setup(options)

vim.cmd[[colorscheme tokyonight]]
