-- ~/.config/nvim/init.lua

-- Define global variables
local vim = vim

-- Set the Python 3 provider
vim.g.python3_host_prog = '/usr/bin/python3'

-- Disable Perl and Ruby providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Set leader keys before loading any plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Configure clipboard tool to use xclip
vim.g.clipboard = {
    name = 'xclip',
    copy = {
      ['+'] = 'xclip -selection clipboard -in',
      ['*'] = 'xclip -selection primary -in',
    },
    paste = {
      ['+'] = 'xclip -selection clipboard -out',
      ['*'] = 'xclip -selection primary -out',
    },
    cache_enabled = 1,
}

-- Set status line to include Codeium status
-- vim.cmd [[
--    set statusline+=%3{codeium#GetStatusString()}
-- ]]

-- Enable termguicolors for true color support
vim.opt.termguicolors = true

-- Load Lazy.nvim and plugin specifications
require("config.lazy")

-- Set the colorscheme after plugins are loaded
vim.cmd('colorscheme gruvbox')

-- Mason setup
local mason_status, mason = pcall(require, "mason")
if mason_status then
    mason.setup()
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if mason_lspconfig_status then
    mason_lspconfig.setup({
        ensure_installed = { "tsserver", "html", "cssls", "tailwindcss", "lua_ls" }
    })
end

-- LSP configuration
local lspconfig = require("lspconfig")
local servers = { "tsserver", "html", "cssls", "tailwindcss", "lua_ls" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {}
end

-- Configure Treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      "vue", "yaml", "xml", "typescript", "javascript", "svelte", "regex", "scheme", "query",
      "ssh_config", "sql", "solidity", "python", "requirements", "powershell", "printf", "lua",
      "jsdoc", "json", "jsonc", "html", "http", "gitignore", "git_config", "editorconfig", "dot",
      "csv", "bash", "c", "cpp", "java", "kotlin", "markdown", "markdown_inline", "perl", "php",
      "ruby", "rust", "scala", "swift", "toml", "vim", "yaml"
    },
    highlight = {
      enable = true,              -- false will disable the whole extension
      additional_vim_regex_highlighting = false,
    },
}

-- Additional Improvements
-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set tab and indentation settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Disable line wrapping
vim.opt.wrap = false

-- Highlight the current line
vim.opt.cursorline = true

-- Enable syntax highlighting and filetype plugins
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

