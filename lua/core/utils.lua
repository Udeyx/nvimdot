local M = {}

M.run = function(plugins)
    local present, packer = pcall(require, 'packer')
    if not present then
        print "can't find packer"
        return
    end

    packer.startup {
        function(use)
            for key, _ in pairs(plugins) do
                plugins[key][1] = key
            end
            for _, v in pairs(plugins) do
                use(v)
            end
        end,
    }
end

return M
