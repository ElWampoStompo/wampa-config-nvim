-- ~/nvim/lua/wampa/plugins/cmp.lua

-- Return a table to be used by lazy.nvim for plugin setup
return {
    "hrsh7th/nvim-cmp", -- Main completion plugin
    event = "InsertEnter", -- Load plugin on entering insert mode
    dependencies = {
        "hrsh7th/cmp-buffer", -- Source for text in buffer
        "hrsh7th/cmp-path", -- Source for file system paths
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*", -- Specify version
            -- Install jsregexp (optional)
            build = "make install_jsregexp",
        },
        "rafamadriz/friendly-snippets", -- Collection of snippets
        "onsails/lspkind.nvim", -- VS Code-like pictograms
        "Exafunction/codeium.vim", -- AI code completion
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
                { name = "nvim_lsp" }, -- LSP source
                { name = "luasnip" }, -- Snippet source
                { name = "buffer" }, -- Buffer source
                { name = "path" }, -- Path source
                { name = "codeium" }, -- AI code completion source
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

-- Possible Improvements:
-- 1. Add more sources for completion, such as spell checking or tags.
-- 2. Customize the appearance of the completion menu using lspkind or other plugins.
-- 3. Fine-tune the snippet expansion behavior to suit specific needs.
-- 4. Explore additional key mappings for better navigation and control.
-- 5. Regularly check for updates to the plugins and adjust configurations accordingly.

