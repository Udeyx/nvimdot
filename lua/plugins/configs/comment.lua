local present, comment = pcall(require, 'Comment')

if not present then
    print "can't find comment"
    return
end
local options = {}
comment.setup(options)
