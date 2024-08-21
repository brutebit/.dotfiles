require 'config.options'
require 'config.keymaps'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" }
  },
  checker = { enabled = true },
})

require 'config.colorscheme'
