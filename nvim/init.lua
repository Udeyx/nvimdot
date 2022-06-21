--require('impatient')
local present, impatient = pcall(require, 'impatient')

if present then
    impatient.enable_profile()
else
    print("can't find impatient")
end

require('core')
require('plugins')
