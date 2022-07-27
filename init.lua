_G.__luacache_config = {
    chunks = {
        enable = true,
        path = vim.fn.stdpath 'cache' .. '/luacache_chunks',
    },
    modpaths = {
        enable = true,
        path = vim.fn.stdpath 'cache' .. '/luacache_modpaths',
    },
}

local present, _ = pcall(require, 'impatient')

if not present then
    return
end

require 'core'
require 'plugins'
