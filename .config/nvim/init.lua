require('xfy.base')
require('xfy.highlights')
require('xfy.maps')
require('xfy.plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('xfy.macos')
end
if is_win then
  require('xfy.windows')
end

