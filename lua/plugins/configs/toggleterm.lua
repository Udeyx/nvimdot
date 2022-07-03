local present, toggleterm = pcall(require, 'toggleterm')

if not present then
    print "can't find toggleterm"
    return
end

local options = {
    direction = 'float',
}

toggleterm.setup(options)
