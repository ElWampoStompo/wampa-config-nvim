-- ~/nvim/lua/wampa/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set mapleader before loading lazy.nvim
vim.g.mapleader = " " -- NOTE: Ensure this is set before any plugin is loaded

require("lazy").setup("wampa.plugins")

-- TODO: Add more plugins as needed and ensure they are configured properly.
-- NOTE: Check for updates and new features in lazy.nvim documentation.
