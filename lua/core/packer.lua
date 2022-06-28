local M = {}

M.run = function(plugins)
    local present, packer = pcall(require, 'packer')
    if not present then
        vim.notify("can't find packer")
        return
    end

    packer.startup({
        config = {
            profile = {
                enable = true,
                threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
            },
        },
        function(use)
            for key, _ in pairs(plugins) do
                plugins[key][1] = key
            end
            for _, v in pairs(plugins) do
                use(v)
            end
        end,
    })
end

return M
