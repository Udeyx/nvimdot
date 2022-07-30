local present, toggleterm = pcall(require, 'toggleterm')

if not present then
    print 'toggleterm not found, please install it'
    return
end

local options = {
    direction = 'float',
}

toggleterm.setup(options)
