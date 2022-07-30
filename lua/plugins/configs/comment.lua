local present, comment = pcall(require, 'Comment')

if not present then
    print 'Comment module not found, please install it'
    return
end
local options = {}

comment.setup(options)
