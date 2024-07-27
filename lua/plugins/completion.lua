-- ~/.config/nvim/lua/plugins/completion.lua

return {
  -- Autocompletion and LSP
  { 'neovim/nvim-lspconfig', event = 'BufEnter' },
  { 'hrsh7th/nvim-cmp', event = 'InsertEnter' },
  { 'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter' },
  { 'hrsh7th/cmp-path', event = 'InsertEnter' },
  { 'hrsh7th/cmp-buffer', event = 'InsertEnter' },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.api.nvim_set_keymap('i', '<C-g>', 'codeium#Accept()', { expr = true, silent = true })
      vim.api.nvim_set_keymap('i', '<C-;>', 'codeium#CycleCompletions(1)', { expr = true, silent = true })
      vim.api.nvim_set_keymap('i', '<C-,>', 'codeium#CycleCompletions(-1)', { expr = true, silent = true })
      vim.api.nvim_set_keymap('i', '<C-x>', 'codeium#Clear()', { expr = true, silent = true })
    end
  },
}
