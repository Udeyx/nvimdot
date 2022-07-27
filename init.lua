local vim = vim
local present = pcall(require, 'impatient')

if not present then
    return
end

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

require 'core'
require 'plugins'
