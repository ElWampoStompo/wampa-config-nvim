-- ~/nvim/lua/wampa/plugins/codeium.lua

return {
    'Exafunction/codeium.vim',
    -- event = 'BufEnter',
    event = 'InsertEnter', -- Load plugin on entering insert mode
    config = function() -- Your config
        vim.g.codeium_disable_bindings = 1
        -- Accept : codeium#Accept() - Accept the current completion
        vim.api.nvim_set_keymap('i', '<C-g>', 'codeium#Accept()', { expr = true, silent = true })
        -- Cycle through completions with ; and ,
        vim.api.nvim_set_keymap('i', '<C-;>', 'codeium#CycleCompletions(1)', { expr = true, silent = true })
        vim.api.nvim_set_keymap('i', '<C-,>', 'codeium#CycleCompletions(-1)', { expr = true, silent = true })
        -- Clear current codeium
        vim.api.nvim_set_keymap('i', '<C-x>', 'codeium#Clear()', { expr = true, silent = true })
    end
}

