require('base')
require('highlights')
require('maps')
require('plugins')
require('rust-cfg')
require('telescope-cfg')

local has = function(x)
  return vim.fn.has(x) == 1
end


