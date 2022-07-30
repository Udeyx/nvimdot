local present, autopairs = pcall(require, 'nvim-autopairs')

if not present then
    print 'nvim-autopairs not found, please install it'
    return
end

-- If you want insert `(` after select function or method item
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp = require 'cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

autopairs.setup()
