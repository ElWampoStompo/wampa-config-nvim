-- ~/.config/nvim/lua/plugins/core.lua

return {
  -- Essential plugins
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim', cmd = 'Telescope' },
  { 'tpope/vim-commentary', event = 'BufEnter' },
  { 'preservim/nerdtree', cmd = 'NERDTreeToggle' },

  -- LSP and Completion
  { 'neovim/nvim-lspconfig', event = 'BufEnter' },
  { 'williamboman/mason.nvim', event = 'BufEnter' },
  { 'hrsh7th/nvim-cmp', event = 'InsertEnter' },
  { 'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter' },
  { 'hrsh7th/cmp-path', event = 'InsertEnter' },
  { 'hrsh7th/cmp-buffer', event = 'InsertEnter' },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', event = 'BufEnter' },

  -- Status Line and Icons
  { 'vim-airline/vim-airline', event = 'BufEnter' },
  { 'vim-airline/vim-airline-themes', event = 'BufEnter' },

  -- Git Integration
  { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, event = 'BufEnter' },

  -- Auto Pairs
  { 'windwp/nvim-autopairs', event = 'InsertEnter' },
}
