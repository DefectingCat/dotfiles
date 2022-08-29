local status, tree = pcall(require, 'nvim-tree')
if (not status) then return end

tree.setup()
