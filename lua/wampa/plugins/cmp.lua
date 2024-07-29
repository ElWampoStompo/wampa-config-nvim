-- ~/nvim/lua/wampa/plugins/cmp.lua

-- This file sets up the nvim-cmp plugin for code completion in Neovim.
-- It is part of the Wampa configuration for lazy.nvim.

-- Return a table to be used by lazy.nvim for plugin setup
return {
    -- The main completion plugin
    "hrsh7th/nvim-cmp",
    -- Load the plugin when entering insert mode
    event = "InsertEnter",
    dependencies = {
        -- Source for text in the current buffer
        "hrsh7th/cmp-buffer",
        -- Source for file system paths
        "hrsh7th/cmp-path",
        -- Snippet plugin for code snippets
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*", -- Specify version
            -- Install jsregexp (optional)
            build = "make install_jsregexp",
        },
        -- Collection of friendly code snippets
        "rafamadriz/friendly-snippets",
        -- VS Code-like pictograms for completion items
        "onsails/lspkind.nvim",
        -- AI code completion plugin
        "Exafunction/codeium.vim",
    },
    config = function()
        -- Import required modules
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local luasnip = require("luasnip")

        -- Load VS Code-like snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        -- Setup nvim-cmp
        cmp.setup({
            snippet = {
                -- Function to expand snippets
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- Key mappings for code completion
                ["<C-d>"] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
                ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll docs down
                ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
                ["<C-e>"] = cmp.mapping.close(), -- Close completion menu
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true, -- Confirm selection
                }),
            }),
            sources = cmp.config.sources({
                -- Sources for code completion
                { name = "nvim_lsp" }, -- LSP source
                { name = "codeium" }, -- AI code completion source
                { name = "luasnip" }, -- Snippet source
                { name = "buffer" }, -- Buffer source
                { name = "path" }, -- Path source
            }),
        })

        -- Set completion options
        vim.cmd([[
            set completeopt=menuone,noinsert,noselect
            highlight! default link CmpItemKind CmpItemMenuDefault
        ]])

        -- TODO: Consider adding more sources like spell, tags, etc.
        -- NOTE: Adjust key mappings as per your workflow.
    end,
}