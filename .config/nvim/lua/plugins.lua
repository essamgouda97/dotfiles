local api = vim.api
local fn = vim.fn

local utils = require('utils')

-- The root dir to install all plugins. Under opt/ or start/
vim.g.plugin_home = fn.stdpath("data") .. "/site/pack/packer"


-- Install packer if not installed
-- Return:
-- true: if this is a fresh install of packer
-- false: if packer has been installed
local function packer_ensure_install()
  local packer_dir = vim.g.plugin_home .. "/opt/packer.nvim"

  if fn.glob(packer_dir) ~= "" then
    return false
  end

  -- Auto install packer
  api.nvim_echo({ {"Installing packer.nvim", "Type"} }, true, {})
  
  local packer_repo = "https://github.com/wbthomason/packer.nvim"
  local install_cmd = string.format("!git clone --depth=1 %s %s", packer_repo, packer_dir)
  vim.cmd(install_cmd)

  return true
end

local fresh_install = packer_ensure_install()

-- Load packer
vim.cmd("packadd packer.nvim")
local packer = require("packer")
local packer_util = require("packer.util")

-- check if firenvim is active
local firenvim_not_active = function()
  return not vim.g.started_by_firenvim
end

packer.startup(function(use)
 
  -- Run impatient.nvim before any other plugins
  use { "lewis6991/impatient.nvim", config = [[require('impatient')]] }

  use { "wbthomason/packer.nvim", opt = true }

  -- Theme
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'hoob3rt/lualine.nvim' -- Statusline 

  -- LSP
  use 'williamboman/mason.nvim'    
  use 'williamboman/mason-lspconfig.nvim' 
    
  -- Python indent (follows the PEP8 style)
  use { "Vimjas/vim-python-pep8-indent", ft = { "python" } }

  -- Python-related text object
  use { "jeetsukumaran/vim-pythonsense", ft = { "python" } }

  use { "machakann/vim-swap", event = "VimEnter" }
end)


