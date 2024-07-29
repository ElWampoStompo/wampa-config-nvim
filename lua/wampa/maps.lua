-- ~/nvim/lua/wampa/maps.lua

-- Set mapleader before defining key mappings
-- vim.g.mapleader = " " -- NOTE: Ensure this is set before any key mappings
-- this is already setup in lazy.lua to run before plugins and maps are called

-- Function to simplify key mapping
local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Key mappings
-- Save
map("n", "<leader>w", "<CMD>update<CR>") -- Save the current buffer

-- Quit
map("n", "<leader>q", "<CMD>q<CR>") -- Quit the current window

-- Exit insert mode
map("i", "jk", "<ESC>") -- Quickly exit insert mode

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>") -- Toggle NeoTree file explorer
map("n", "<leader>r", "<CMD>Neotree focus<CR>") -- Focus on NeoTree file explorer

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>") -- Open a vertical split
map("n", "<leader>p", "<CMD>split<CR>") -- Open a horizontal split

-- Window Navigation
map("n", "<C-h>", "<C-w>h") -- Move to the left window
map("n", "<C-l>", "<C-w>l") -- Move to the right window
map("n", "<C-k>", "<C-w>k") -- Move to the upper window
map("n", "<C-j>", "<C-w>j") -- Move to the lower window

-- Resize Windows
map("n", "<C-Left>", "<C-w><") -- Decrease window width
map("n", "<C-Right>", "<C-w>>") -- Increase window width
map("n", "<C-Up>", "<C-w>+") -- Increase window height
map("n", "<C-Down>", "<C-w>-") -- Decrease window height

-- TODO: Add more key mappings as needed for your workflow.
-- NOTE: Customize these mappings to suit your preferences.

