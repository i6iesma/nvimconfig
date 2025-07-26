
-- Set global options before anything else
require("Inigo.core.options")









-- Bootstrap Packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Reload Neovim and sync plugins when plugins-setup.lua is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/Inigo/plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Safely import packer
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- Load plugin definitions
require("Inigo.plugins-setup")

-- Run :PackerSync if we just bootstrapped packer
if packer_bootstrap then
  print("Packer was just bootstrapped. Running sync...")
  require("packer").sync()
  vim.cmd("echo 'Plugins installed/updated. Please restart Neovim.'")
  return
end

-- Load core configurations
require("Inigo.core.keymaps")
require("Inigo.core.colorscheme")

-- Load plugin-specific configurations
require("Inigo.plugins.nvim-cmp-config")
require("Inigo.plugins.mason")
require("Inigo.plugins.lsp")
require("Inigo.plugins.treesitter")
require("Inigo.plugins.autopairs")
require("Inigo.plugins.colorizer")
require("Inigo.plugins.colorpicker")
require("Inigo.plugins.comment")
require("Inigo.plugins.gitsigns")
require("Inigo.plugins.lualine")
require("Inigo.plugins.nvim-tree")
require("Inigo.plugins.telescope")

