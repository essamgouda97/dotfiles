local fn = vim.fn

local M = {}

function M.executable(name)
  if fn.executable(name) > 0 then
    return true
  end

  return false
end

--- Check whether a feature exists in nvim
--@feat: string
-- the feature name, like 'nvim-0.5' or 'unix'
-- return: bool
M.has = function(feat)
  if fn.has(feat) == 1 then
    return true
  end

  return false
end

--- Create a dir if it doesn't exist
function M.may_create_dir(dir)
  local res = fn.isdirectory(dir)

  if res == 0 then
    fn.mkdir(dir, 'p')
  end
end

function M.get_nvim_version()
  local actual_ver = vim.version()

  local nvim_ver_str = string.format('%d.%d.%d', actual_ver.major, actual_ver.minor, actual_ver.patch)
  return nvim_ver_str
end

-- Generate random integers in the range [Low, High], inclusive,
-- @low: the lower value for this range
-- @high: the upper value for this range
function M.rand_int(low, high)
  math.randomseed(os.time())

  return math.rand(low, high)
end

-- Select a random element from a sequence/list
-- @seq: the sequence to select from
function M.rand_element(seq)
  local idx = M.rand_int(1, #seq)
  return seq[idx]
end

function M.add_pack(name)
  local status, error = pcall(vim.cmd, "packadd " .. name)

  return status
end

return M


