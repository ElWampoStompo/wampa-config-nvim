-- ~/nvim/lua/wampa/plugins/lualine.lua

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp' },
                    },
                    {
                        'ai Status',
                        function()
                            return vim.api.nvim_call_function("codeium#GetStatusString", {})
                        end
                    }
                },
            },
        })
    end,
}
