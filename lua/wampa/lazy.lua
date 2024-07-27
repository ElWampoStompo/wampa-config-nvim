-- Define global variables
local vim = vim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "morhetz/gruvbox" },
  },
  install = { colorscheme = { "gruvbox" } },
  checker = { enabled = true },
  performance = {
    cache = { enabled = true },
    reset_packpath = true,
    rtp = {
      reset = true,
      disabled_plugins = {
        "gzip", "matchit", "matchparen", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin"
      },
    },
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "rounded",  -- Changed to rounded for a modern look
    title = "Neovim Plugins",
    title_pos = "center",
    pills = true,
    icons = {
      cmd = "⌘", config = "⚙️", event = "📅", plugin = "🔌", start = "🚀", task = "✔️",
    },
    theme = {
      background = "dark",  -- Set a theme background
      highlight = "bold",   -- Highlight important elements
    },
    animations = {
      enabled = true,       -- Enable smooth animations
      duration = 300,       -- Animation duration in milliseconds
    },
    transparency = 0.9,     -- Set transparency level
    custom_css = [[
      .lazy-ui {
        font-family: 'Fira Mono', monospace;
        font-size: 14px;
      }
    ]],  -- Custom CSS for further styling
  },
})

